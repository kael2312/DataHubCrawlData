using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using HtmlAgilityPack;
using Newtonsoft.Json;
using HtmlDocument = HtmlAgilityPack.HtmlDocument;

namespace D2LBrightspaceCrawlData
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private async void OnGetData(object sender, EventArgs e)
        {
            try
            {
                HtmlDocument htmlDoc =
                    await GetHtmlDocument("https://community.d2l.com/brightspace/kb/articles/4520-awards-data-sets");
                if (htmlDoc != null)
                {
                    // Select the ul tag with class linkList
                    HtmlNode ulTag = htmlDoc.DocumentNode.SelectSingleNode("//ul[@class='linkList']");

                    // Get all a tags in the ul tag
                    var aTags = ulTag.SelectNodes(".//a");

                    // Create a list to store the href attributes
                    List<string> hrefs = new List<string>();

                    // Get the href attribute of each a tag and add it to the list
                    if (aTags != null)
                    {
                        foreach (var aTag in aTags)
                        {
                            string href = aTag.GetAttributeValue("href", "");
                            hrefs.Add(href);
                        }
                    }

                    List<string> filteredHrefs = hrefs.Where(href => href.EndsWith("data-sets")).ToList();
                    
                    // Create a StringBuilder to store all tables content
                    StringBuilder allTablesContent = new StringBuilder();

                    foreach (var url in filteredHrefs)
                    {
                        HtmlDocument doc = await GetHtmlDocument(url);
                        // Get all h2 tags with the data-id attribute
                        var h2Tags = doc.DocumentNode.SelectNodes("//h2[@data-id]");

                        // Create a list to store the first table tag after each h2 tag
                        Dictionary<string, HtmlNode> tables = new Dictionary<string, HtmlNode>();
                        
                        //List<HtmlNode> tables = new List<HtmlNode>();
                        // Find the first table tag after each h2 tag
                        if (h2Tags != null)
                        {
                            foreach (var h2Tag in h2Tags)
                            {
                                HtmlNode sibling = h2Tag.NextSibling;

                                // Keep getting the next sibling until you find a table tag
                                // Keep getting the next sibling until you find a table tag or another h2 tag
                                while (sibling != null && sibling.Name != "table" && sibling.Name != "h2")
                                {
                                    sibling = sibling.NextSibling;
                                }

                                // If a table tag was found, add it to the list
                                if (sibling != null && sibling.Name == "table")
                                {
                                    tables.Add(h2Tag.InnerText, sibling);
                                }
                            }


                            // Loop through each table
                            foreach (var table in tables)
                            {
                                // Select the first row (header)
                                var headerRow = table.Value.SelectSingleNode(".//tr[1]");

                                // Get the text content of the header cells
                                var headersTh = headerRow.SelectNodes(".//th");
                                if (headersTh == null) continue;
                                var headers = headersTh.Select(th => th.InnerText.Trim()).ToList();

                                // Check if headers contain "Field" and "Type"
                                if (!headers.Contains("Field") || !headers.Contains("Type")) continue;
                                
                                // Create a StringBuilder to store the table content
                                StringBuilder sb = new StringBuilder();
                                
                                // Select all rows except the first one
                                var rows = table.Value.SelectNodes(".//tr[position()>=1]");

                                // Loop through each row
                                foreach (var row in rows)
                                {
                                    // Select the first and second cells
                                    var cells = row.SelectNodes(".//td[position()=2 or position()=4 or position()=5]");

                                    if (cells == null) continue;

                                    // Get the text content of the cells
                                    string field = cells[0].InnerText.Trim();
                                    string type = cells[1].InnerText.Trim();
                                    string size = "";
                                    if(type == "varchar")
                                    {
                                        size = cells[2].InnerText.Trim();
                                        type = $"nvarchar ({size})";
                                    }
                                    else if(type == "nvarchar")
                                    {
                                        size = cells[2].InnerText.Trim();
                                        type = $"nvarchar ({size})";
                                    }
                                    else if(type == "decimal")
                                    {
                                        type = "float";
                                    }
                                    else if(type == "datetime2")
                                    {
                                        type = "datetime";
                                    }
                                    else if(type == "uniqueidentifier")
                                    {
                                        size = cells[2].InnerText.Trim();
                                        type = $"nvarchar ({size})";
                                    }
                                    else if (type == "Integer")
                                    {
                                        type = "int";
                                    }
                                    else if(type == "Navchar")
                                    {
                                        size = cells[2].InnerText.Trim();
                                        type = $"nvarchar ({size})";
                                    }

                                    // Add the field and type to the StringBuilder
                                    sb.AppendLine($"{field} {type},");
                                }
                                
                                // Write the StringBuilder content to a file
                                string tableName = table.Key.Replace(" ", "_");
                                allTablesContent.AppendLine($"IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = '{tableName}')\n" +
                                                            $"CREATE TABLE {tableName} (\n{sb.ToString()}\n);\nGO");
                            }
                        }
                    }
                    
                    // Write the allTablesContent content to a single file
                    File.WriteAllText("AllTables.sql", allTablesContent.ToString());
                }
                else
                {
                    MessageBox.Show("Error fetching data.");
                }

                MessageBox.Show("Finish");
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                throw;
            }
        }

        private async Task<HtmlDocument> GetHtmlDocument(string url)
        {
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    HttpResponseMessage response = await client.GetAsync(url);
                    if (response.IsSuccessStatusCode)
                    {
                        string content = await response.Content.ReadAsStringAsync();
                        HtmlDocument doc = new HtmlDocument();
                        doc.LoadHtml(content);
                        return doc;
                    }
                    else
                    {
                        return null;
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    throw;
                }
            }
        }
    }
}