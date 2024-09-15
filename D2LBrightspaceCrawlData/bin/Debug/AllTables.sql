IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Accommodations_Profile_Log')
CREATE TABLE Accommodations_Profile_Log (
AccommodatedUserId bigint,
OrgUnitId bigint,
QuizTimeLimitMultiplier float,
QuizTimeLimitExtraTime int,
QuizControlAlwaysAllowRightClick bit,
ModifiedBy bigint,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Activity_Feed_Comment_Log')
CREATE TABLE Activity_Feed_Comment_Log (
LogId nvarchar (16),
UserId int,
OrgUnitId int,
CommentId nvarchar (16),
Action nvarchar (16),
ActionDate datetime,
Content nvarchar (3072),
PostId nvarchar (16),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Activity_Feed_Comment_Objects')
CREATE TABLE Activity_Feed_Comment_Objects (
OrgUnitId int,
CommentId nvarchar (16),
LastModifiedBy int,
LastModified datetime,
Content nvarchar (3072),
IsDeleted bit,
PostId nvarchar (16),
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Activity_Feed_Post_Log')
CREATE TABLE Activity_Feed_Post_Log (
LogId nvarchar (16),
UserId int,
OrgUnitId int,
PostId nvarchar (16),
PostType nvarchar (16),
Action nvarchar (16),
ActionDate datetime,
DropboxId bigint,
Content nvarchar (3072),
CommentCount int,
AttachmentCount int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Activity_Feed_Post_Objects')
CREATE TABLE Activity_Feed_Post_Objects (
OrgUnitId int,
PostId nvarchar (16),
PostType nvarchar (16),
LastModifiedBy int,
LastModified datetime,
DropboxId bigint,
Content nvarchar (3072),
IsDeleted bit,
CommentCount int,
AttachmentCount int,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Impersonated_Session_History')
CREATE TABLE Impersonated_Session_History (
SessionId int,
OrgUnitId int,
UserId int,
Username nvarchar,
DateStarted DateTime,
DateEnded DateTime,
ImpersonatingUserId int,
ImpersonatingUsername nvarchar (540),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Announcements')
CREATE TABLE Announcements (
AnnouncementId bigint,
OrgUnitId bigint,
Title nvarchar (400),
StartDate datetime,
EndDate datetime,
IsGlobal bit,
IsDraft bit,
NumAttachments int,
DeletedDate datetime,
DeletedByUserId int,
LastModified datetime,
LastModifiedBy int,
CreatedBy int,
IsAuthorInfoShown bit,
CreatedDate datetime,
ResultId bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Assignment_Special_Access')
CREATE TABLE Assignment_Special_Access (
DropboxId bigint,
UserId int,
StartDate datetime,
EndDate datetime,
DueDate datetime,
ModifiedBy int,
LastModified datetime,
IsDeleted bit,
StartDateAvailabilityType smallint,
EndDateAvailabilityType smallint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Assignment_Submission_Details')
CREATE TABLE Assignment_Submission_Details (
SubmissionId bigint,
DropboxId bigint,
UserId bigint,
GroupId bigint,
NumberOfFilesSubmitted int,
TotalFileSize bigint,
SubmittedByUserId int,
DateSubmitted datetime,
Comments nvarchar (1000),
IsTurnItInExempt bit,
IsDeleted bit,
IsPreview bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Assignment_Submissions')
CREATE TABLE Assignment_Submissions (
DropboxId bigint,
OrgUnitId int,
SubmitterId bigint,
SubmitterType nvarchar (5),
FileSubmissionCount int,
TotalFileSize bigint,
FeedbackUserId int,
FeedbackIsRead bit,
Score float,
IsGraded bit,
LastSubmissionDate datetime,
Feedback nvarchar (1000),
FeedbackLastModified datetime,
FeedbackReadDate datetime,
CompletionDate datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Assignment_Summary')
CREATE TABLE Assignment_Summary (
DropboxId bigint,
OrgUnitId int,
Name nvarchar (128),
Category nvarchar (128),
Type nvarchar (10),
GradeItemId bigint,
PossibleScore float,
StartDate datetime,
EndDate datetime,
DueDate datetime,
IsRestricted bit,
IsDeleted bit,
TurnItInEnabled bit,
IsHidden bit,
SortOrder int,
SubmissionType nvarchar (18),
CompletionType nvarchar (27),
ResultId int,
CategoryId bigint,
Version bigint,
StartDateAvailabilityType smallint,
EndDateAvailabilityType smallint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'TurnItIn_Submissions')
CREATE TABLE TurnItIn_Submissions (
DropboxId bigint,
SubmissionId bigint,
FileId bigint,
LastSubmissionDate datetime,
SubmissionStatus smallint,
SubmissionErrorType smallint,
ErrorMessage nvarchar (255),
SubmittedBy int,
LastRefreshDate datetime,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Attendance_Registers')
CREATE TABLE Attendance_Registers (
AttendanceRegisterId bigint,
OrgUnitId int,
Name nvarchar (128),
Description nvarchar (1000),
SchemeId bigint,
IsVisible bit,
IncludeAllUsers bit,
CauseForConcern float,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Attendance_Schemes')
CREATE TABLE Attendance_Schemes (
SchemeId bigint,
OrgUnitId int,
SchemeName nvarchar (128),
SchemeSymbolId bigint,
SymbolName nvarchar (128),
SymbolValue nvarchar (50),
Percentage float,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Attendance_Sessions')
CREATE TABLE Attendance_Sessions (
AttendanceSessionId bigint,
AttendanceRegisterId bigint,
Name nvarchar (128),
Description nvarchar (256),
SortOrder int,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Attendance_User_Sessions')
CREATE TABLE Attendance_User_Sessions (
UserId int,
AttendanceSessionId bigint,
SchemeSymbolId bigint,
LastModified datetime,
LastModifiedBy int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Award_Objects')
CREATE TABLE Award_Objects (
AwardId bigint,
Name nvarchar (256),
AwardTypeId int,
Type nvarchar (128),
Description nvarchar (512),
ExpiryCalculationType nvarchar (128),
ExpiryNotificationType nvarchar (128),
ExpiryDate datetime,
ImagePath nvarchar (1000),
CreatedByUserId bigint,
LastModified datetime,
IsDeleted bit,
Criteria nvarchar (1000),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Awards_Issued')
CREATE TABLE Awards_Issued (
AwardId bigint,
OrgUnitId bigint,
UserId bigint,
IssuedBy int,
IssueDate datetime,
ExpiryDate datetime,
IssuedId bigint,
Criteria nvarchar (1000),
Evidence nvarchar (1000),
RevokedDate datetime,
RevokedReason nvarchar (1000),
RevokedBy bigint,
LastModifiedBy bigint,
LastModifiedDate datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Course_Awards')
CREATE TABLE Course_Awards (
AssociationId bigint,
AwardId bigint,
OrgUnitId bigint,
DateCreated datetime,
HiddenAward bit,
ConditionSetId bigint,
LastModified datetime,
Credits float,
IsAssociated bit,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Calendar_Events')
CREATE TABLE Calendar_Events (
ScheduleId bigint,
OrgUnitId bigint,
UserId bigint,
Title nvarchar (256),
StartDate datetime,
EndDate datetime,
TimeZoneIdentifier nvarchar (256),
IsAllDayEvent bit,
RecurrenceType nvarchar (7),
RecurrenceInterval int,
CreatedByUserId int,
LastModified datetime,
EventObjectTypeName nvarchar (200),
ObjectLookupId1 bigint,
ObjectLookupId2 bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Checklist_Category_Details')
CREATE TABLE Checklist_Category_Details (
CategoryId bigint,
ChecklistId bigint,
Name nvarchar (512),
Description nvarchar (1000),
DescriptionIsHtml bit,
SortOrder int,
LastModifiedUtc datetime,
DateDeleted datetime,
DeletedBy int,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Checklist_Completions')
CREATE TABLE Checklist_Completions (
UserId int,
DateCompleted datetime,
ItemId bigint,
LastModified datetime,
IsCompleted bit,
DateDeleted datetime,
DeletedBy int,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Checklist_Item_Details')
CREATE TABLE Checklist_Item_Details (
ItemId bigint,
CategoryId bigint,
Name nvarchar (512),
Description nvarchar (1000),
DescriptionIsHtml bit,
DueDate datetime,
ScheduleId int,
SortOrder int,
IsAutoChecked bit,
LastModifiedUtc datetime,
DateDeleted datetime,
DeletedBy int,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Checklist_Objects')
CREATE TABLE Checklist_Objects (
ChecklistId bigint,
OrgUnitId int,
Name nvarchar (512),
Description nvarchar (1000),
DescriptionIsHtml bit,
SharedUserId int,
DisplayInNewWindow bit,
SortOrder int,
Version bigint,
ResultId int,
DateDeleted datetime,
DeletedBy int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Competency_Activities')
CREATE TABLE Competency_Activities (
ActivityId bigint,
OrgUnitId int,
ActivityName nvarchar (256),
ActivityTypeId int,
AssessmentType nvarchar (7),
ObjectLookupId bigint,
RubricId bigint,
LevelId bigint,
RubricCriterionId bigint,
AssessmentThresholdCriteria nvarchar (2),
AssessmentThreshold float,
IsAutoEval bit,
RubricName nvarchar (256),
RubricLevelRequired nvarchar (256),
ObjectId bigint,
ActivityType nvarchar (50),
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Competency_Activity_Log')
CREATE TABLE Competency_Activity_Log (
ActivityId bigint,
ActivityLogId bigint,
LogTypeId int,
LogTypeName nvarchar (19),
LogDateTime datetime,
ModifiedBy bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Competency_Activity_Results')
CREATE TABLE Competency_Activity_Results (
ActivityId bigint,
OrgUnitId int,
UserId int,
LearningObjectId bigint,
IsAchieved bit,
PercentAchieved float,
RubricScore float,
RubricLevelAchieved nvarchar (256),
RubricId bigint,
RubricCriterionId bigint,
AchievedDate datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Competency_Log')
CREATE TABLE Competency_Log (
CompetencyLogId bigint,
LogTypeId int,
LogTypeName nvarchar (19),
ObjectId bigint,
ObjectTypeId int,
ObjectTypeName nvarchar (18),
ObjectVersion int,
LogDateTime datetime,
ModifiedBy bigint,
IndirectObjectId bigint,
IndirectObjectTypeName nvarchar (18),
IndirectObjectTypeId int,
IndirectObjectVersion int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Competency_Objects')
CREATE TABLE Competency_Objects (
ObjectId bigint,
OrgUnitId int,
Name nvarchar (256),
Type nvarchar (256),
ReadyForEvaluation bit,
Status nvarchar (9),
Description nvarchar (1000),
NeedReevaluation bit,
ReevaluationIfAchieved bit,
ReevaluationIfNotAchieved bit,
AdditionalIdentifier nvarchar (512),
IsHidden bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Competency_Structure')
CREATE TABLE Competency_Structure (
ObjectId bigint,
ParentObjectId bigint,
BaseObjectID bigint,
Depth int,
EntryTime int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Content_Files_Properties_Log')
CREATE TABLE Content_Files_Properties_Log (
OrgUnitId int,
ContentObjectId int,
Action nvarchar (10),
FilePath nvarchar (10000),
FileName nvarchar (512),
FileExtension nvarchar (512),
FileSizeBytes bigint,
UploadDate datetime,
LastModifiedBy int,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Content_Objects')
CREATE TABLE Content_Objects (
ContentObjectId int,
OrgUnitId int,
Title nvarchar (150),
ContentObjectType nvarchar (6),
CompletionType nvarchar (7),
ParentContentObjectId int,
Location nvarchar (1024),
StartDate datetime,
EndDate datetime,
DueDate datetime,
ObjectId1 int,
ObjectId2 int,
ObjectId3 int,
LastModified datetime,
IsDeleted bit,
SortOrder int,
Depth int,
ToolId int,
IsHidden bit,
ResultId int,
DeletedDate datetime,
CreatedBy int,
LastModifiedBy int,
DeletedBy int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Content_User_Completion')
CREATE TABLE Content_User_Completion (
ContentObjectId int,
OrgUnitId int,
UserId int,
DateCompleted datetime,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Content_User_Progress')
CREATE TABLE Content_User_Progress (
ContentObjectId int,
UserId int,
CompletedDate datetime,
LastVisited datetime,
IsRead bit,
NumRealVisits int,
NumFakeVisits int,
TotalTime bigint,
IsVisited bit,
IsCurrentBookmark bit,
IsSelfAssessComplete bit,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Audio_Video_Processed')
CREATE TABLE Audio_Video_Processed (
ContentId nvarchar (16),
RevisionId nvarchar (16),
RevisionNumber int,
Type nvarchar (5),
Source nvarchar (32),
RevisionSize bigint,
Duration int,
RequiredTranscoding bit,
RequiredTranscribing bit,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Media_Consumption_Log')
CREATE TABLE Media_Consumption_Log (
LogId nvarchar (16),
UserId int,
ContentId nvarchar (16),
RevisionId nvarchar (16),
ContentType nvarchar (5),
ClientApp nvarchar (32),
DateConsumed datetime,
DurationPercentageWatched int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Media_Objects')
CREATE TABLE Media_Objects (
ContentId nvarchar (16),
Title nvarchar (1000),
RevisionCount int,
OwnerId int,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CPD_Job_Targets')
CREATE TABLE CPD_Job_Targets (
PrincipalId int,
SubjectId int,
JobTitle nvarchar (4000),
StructuredMinutes int,
UnstructuredMinutes int,
StructuredRecordCount int,
UnstructuredRecordCount int,
StartDate datetime,
DateDeleted datetime,
LastModified datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CPD_Methods')
CREATE TABLE CPD_Methods (
MethodId int,
Name nvarchar (4000),
LastModified datetime,
DateDeleted datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CPD_Question_Answers')
CREATE TABLE CPD_Question_Answers (
AnswerId int,
AnswerText nvarchar (4000),
QuestionId int,
RecordId int,
UserId int,
Action nvarchar (16),
LastModified datetime,
DateDeleted datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CPD_Questions')
CREATE TABLE CPD_Questions (
QuestionId int,
QuestionText nvarchar (4000),
LastModified datetime,
DateDeleted datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CPD_Subjects')
CREATE TABLE CPD_Subjects (
SubjectId int,
Name nvarchar (4000),
LastModified datetime,
DateDeleted datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CPD_User_Records')
CREATE TABLE CPD_User_Records (
RecordId int,
RecordName nvarchar (256),
State nvarchar (50),
UserId int,
Subject int,
Method int,
CreditMinutes int,
Evidence nvarchar (4000),
Type nvarchar (50),
Grade float,
DateCompleted datetime,
LastModified datetime,
DateDeleted datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CPD_User_Targets')
CREATE TABLE CPD_User_Targets (
PrincipalId int,
SubjectId int,
UserId int,
StructuredMinutes int,
UnstructuredMinutes int,
StructuredRecordCount int,
UnstructuredRecordCount int,
StartDate datetime,
DateDeleted datetime,
LastModified datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Course_Copy_Logs')
CREATE TABLE Course_Copy_Logs (
SourceOrgUnitId int,
DestinationOrgUnitId int,
UserId bigint,
Status nvarchar (128),
StartDate datetime,
EndDate datetime,
IsDestinationNew bit,
CopyProtectedResources bit,
CopyCourseJobId bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Course_Publisher_Launches')
CREATE TABLE Course_Publisher_Launches (
LaunchId nvarchar (16),
OrgUnitId int,
RecipientId nvarchar (16),
UserId int,
RoleId int,
LaunchMethod nvarchar (256),
ExternalUserId nvarchar (256),
ExternalLMSType nvarchar (256),
IsNewUser bit,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Course_Publisher_Recipients')
CREATE TABLE Course_Publisher_Recipients (
RecipientID nvarchar (16),
Name nvarchar (256),
CreatedAt datetime,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Creator_Practices_Adoption')
CREATE TABLE Creator_Practices_Adoption (
ActivityInstanceId int,
CreatedById int,
OrgUnitId int,
PracticeType nvarchar (32),
PracticeTitle nvarchar (255),
ProviderObjectId int,
CreatedDate datetime,
Version int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Creator_Practices_Engagement')
CREATE TABLE Creator_Practices_Engagement (
PracticeEngagementId int,
UserId int,
OrgUnitId int,
CompletionStatus nvarchar (10),
ActivityInstanceId int,
CompletionDate datetime,
Version int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Discussion_Forums')
CREATE TABLE Discussion_Forums (
OrgUnitId int,
ForumId bigint,
Name nvarchar (400),
Description nvarchar (1000),
MustPostToParticipate bit,
AllowAnon bit,
IsHidden bit,
RequiresApproval bit,
SortOrder int,
IsDeleted bit,
DeletedDate datetime,
DeletedByUserId int,
ResultId int,
StartDate datetime,
StartDateAvailabilityType smallint,
EndDate datetime,
EndDateAvailabilityType smallint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Discussion_Posts')
CREATE TABLE Discussion_Posts (
OrgUnitId int,
TopicId bigint,
UserId int,
PostId bigint,
ThreadId bigint,
IsReply bit,
ParentPostId bigint,
NumReplies int,
DatePosted datetime,
IsDeleted bit,
RatingSum bigint,
NumRatings bigint,
Score float,
LastEditDate datetime,
SortOrder int,
Depth int,
Thread nvarchar (400),
WordCount int,
AttachmentCount int,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Discussion_Posts_Read_Status')
CREATE TABLE Discussion_Posts_Read_Status (
TopicId bigint,
UserId int,
PostId bigint,
IsRead bit,
FirstReadDate datetime,
LastReadDate datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Discussion_Topics')
CREATE TABLE Discussion_Topics (
OrgUnitId int,
TopicId bigint,
ForumId bigint,
Name nvarchar (1000),
Description nvarchar (1000),
MustPostToParticipate bit,
AllowAnon bit,
IsHidden bit,
RequiresApproval bit,
LastPostDate datetime,
LastPostUserId bigint,
NumViews bigint,
SortOrder int,
IsDeleted bit,
DeletedDate datetime,
DeletedByUserId int,
GradeItemId int,
ScoreOutOf float,
ScoreCalculationMethod nvarchar (19),
IncludeNonScoredValues bit,
Version bigint,
ResultId int,
StartDate datetime,
StartDateAvailabilityType smallint,
EndDate datetime,
EndDateAvailabilityType smallint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Discussion_Topic_User_Scores')
CREATE TABLE Discussion_Topic_User_Scores (
UserId int,
TopicId bigint,
Score float,
IsGraded bit,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Activity_Exemptions_Log')
CREATE TABLE Activity_Exemptions_Log (
OrgUnitId int,
UserId int,
ObjectId int,
ActivityId nvarchar (225),
LogTypeName nvarchar (50),
LastModifiedUtc datetime,
LastModifiedBy int,
ActivityExemptionsLogId bigint,
ToolId int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Grade_Book_Settings')
CREATE TABLE Grade_Book_Settings (
OrgUnitId int,
GradeSchemeId bigint,
GradingSystem nvarchar (8),
UngradedItems nvarchar (25),
IsAdjustedFinalGradeReleased bit,
IsCalculatedFinalGradeReleased bit,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Grade_Objects')
CREATE TABLE Grade_Objects (
GradeObjectId int,
OrgUnitId int,
ParentGradeObjectId int,
Name nvarchar (128),
TypeName nvarchar (50),
StartDate datetime,
EndDate datetime,
IsAutoPointed bit,
IsFormula bit,
IsBonus bit,
MaxPoints float,
CanExceedMaxGrade bit,
ExcludeFromFinalGradeCalc bit,
GradeSchemeId bigint,
Weight float,
NumLowestGradesToDrop int,
NumHighestGradesToDrop int,
WeightDistributionType nvarchar (8),
CreatedDate datetime,
ToolName nvarchar (50),
AssociatedToolItemId bigint,
LastModified datetime,
ShortName nvarchar (128),
GradeObjectTypeId int,
SortOrder int,
IsDeleted bit,
DeletedDate datetime,
DeletedByUserId int,
ResultId int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Grade_Objects_Log')
CREATE TABLE Grade_Objects_Log (
LogId bigint,
Name nvarchar (50),
GradeObjectId int,
UserId int,
GradeSymbolString nvarchar (50),
PointsDenominator float,
PointsNumerator float,
WeightedDenominator float,
WeightedNumerator float,
Modified datetime,
ModifiedBy int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Grade_Results')
CREATE TABLE Grade_Results (
GradeObjectId int,
OrgUnitId int,
UserId int,
PointsNumerator float,
PointsDenominator float,
WeightedNumerator float,
WeightedDenominator float,
IsReleased bit,
IsDropped bit,
LastModified datetime,
LastModifiedBy int,
Comments nvarchar (1000),
PrivateComments nvarchar (1000),
IsExempt bit,
GradeText nvarchar (50),
GradeReleasedDate datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Grade_Schemes')
CREATE TABLE Grade_Schemes (
GradeSchemeId bigint,
OrgUnitId int,
SchemeName nvarchar (128),
DeletedDate datetime,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Grade_Scheme_Ranges')
CREATE TABLE Grade_Scheme_Ranges (
GradeSchemeRangeId bigint,
GradeSchemeId bigint,
SymbolString nvarchar (100),
AssignedValue float,
RangeStart float,
IsDeleted bit,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Intelligent_Agent_Objects')
CREATE TABLE Intelligent_Agent_Objects (
AgentId bigint,
OrgUnitId int,
AgentName nvarchar (128),
Description nvarchar (1000),
Enabled bit,
SpecificRoles nvarchar (1000),
LoginConditionEnabled bit,
LoginConditionThreshold int,
LoginConditionType nvarchar (14),
AccessConditionEnabled bit,
AccessConditionThreshold int,
AccessConditionType nvarchar (20),
ResultId bigint,
RepeatType nvarchar (10),
EmailWhenSatisfied bit,
EnableSchedule bit,
ScheduleType nvarchar (8),
ScheduleRepeatsEvery int,
StartDate datetime,
EndDate datetime,
LastModified datetime,
LastModifiedBy int,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Intelligent_Agent_Run_Log')
CREATE TABLE Intelligent_Agent_Run_Log (
AgentId bigint,
AgentRunId bigint,
IsPracticeRun bit,
IsRunNow bit,
NumUsers int,
NumUsersWithErrors int,
NumUsersWithInfos int,
NumUsersWithWarnings int,
RunUserId int,
RunDate datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Intelligent_Agent_Run_Users')
CREATE TABLE Intelligent_Agent_Run_Users (
AgentId bigint,
AgentRunId bigint,
UserId int,
OrgUnitId int,
ActionTypeName nvarchar (50),
ActionHasError bit,
ActionHasInfo bit,
ActionHasWarning bit,
ShouldRetry bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'JIT_Provisioned_Users_Log')
CREATE TABLE JIT_Provisioned_Users_Log (
UserId int,
MappingField nvarchar (32),
MappingFieldValue nvarchar (270),
ProviderType nvarchar (32),
ProviderId nvarchar (1024),
RoleId int,
Timestamp datetime,
Action nvarchar (16),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Local_Authentication_Security_Log')
CREATE TABLE Local_Authentication_Security_Log (
UserId int,
Action nvarchar (70),
ModifiedBy int,
ModifiedDate datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'LTI_Advantage_Deployment_Audit')
CREATE TABLE LTI_Advantage_Deployment_Audit (
Action nvarchar (10),
DeploymentID nvarchar (36),
ClientID nvarchar (36),
DeploymentName nvarchar (200),
IsDeploymentEnabled bit,
HasAssignmentsAndGrades bit,
HasDeepLinking bit,
HasNamesAndRoles bit,
HasSubmissionReview bit,
HasActivityItemProfile bit,
HasPlatformNotificationService bit,
HasContextCopy bit,
ModifiedBy bigint,
Anonymous bit,
PreProvisioningEnabled bit,
SendOrgUnitInfo bit,
SendUserFirstName bit,
SendUserMiddleName bit,
SendUserLastName bit,
SendUserEmail bit,
SendBrightspaceUserID bit,
SendBrightspaceUsername bit,
SendBrightspaceOrgDefinedId bit,
SendLinkTitle bit,
SendLinkDescription bit,
OpenAsExternal bit,
AutoMigrateLinks bit,
IsSharedToManyOrgUnits bit,
AutoCreateGrades bit,
IncludeInFinalGrade bit,
Timestamp datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'LTI_Advantage_Registration_Audit')
CREATE TABLE LTI_Advantage_Registration_Audit (
Action nvarchar (10),
ClientId nvarchar (255),
ToolName nvarchar (200),
Domain nvarchar (2083),
RedirectURLs nvarchar (2083),
KeysetURL nvarchar (255),
LoginURL nvarchar (255),
LTIVersion nvarchar (12),
IsRegistrationEnabled bit,
SendInstitutionRole bit,
TargetLinkURI nvarchar (255),
ModifiedBy bigint,
HasAssignmentAndGradeServices bit,
HasSubmissionReview bit,
HasDeepLinking bit,
HasNamesAndRoleProvisioningServices bit,
HasActivityItemProfile bit,
HasPlatformNotificationService bit,
Timestamp datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'LTI_Launches')
CREATE TABLE LTI_Launches (
LTILaunchId nvarchar (16),
UserId int,
IMSRoleNames nvarchar (10000),
ImpersonatingUserId bigint,
ImpersonatingUserIMSRoleName nvarchar (10000),
LaunchDate datetime,
OrgUnitId bigint,
LTILinkId bigint,
DeploymentId nvarchar (16),
ClientId nvarchar (16),
ToolProviderId nvarchar (300),
ContentTopicId bigint,
ParentModuleId bigint,
Placement nvarchar (10),
MessageVersion nvarchar (10),
RequestType nvarchar (30),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'LTI_Link_Migration_Audit')
CREATE TABLE LTI_Link_Migration_Audit (
LTIMigrationId nvarchar (16),
UserId bigint,
MigrationDate datetime,
OrgUnitId bigint,
LinkId bigint,
LinkURL nvarchar (2000),
LinkName nvarchar (200),
ClientId nvarchar (255),
RegistrationDomain nvarchar (2083),
DeploymentId nvarchar (16),
JobId bigint,
Status smallint,
FailureCode smallint,
MigrationType smallint,
LegacyURL nvarchar (2083),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'LTI_Links')
CREATE TABLE LTI_Links (
LtiLinkId bigint,
OrgUnitId int,
Title nvarchar (200),
LinkType int,
LTIVersion nvarchar (12),
Url nvarchar (2000),
Description nvarchar (1000),
IsVisible bit,
SendTCInfo bit,
SendContextInfo bit,
SendCourseInfo bit,
SendOrgUnitInfo bit,
SendUserId bit,
SendUserName bit,
SendUserEmail bit,
SendLinkTitle bit,
SendLinkDescription bit,
SendD2LUserName bit,
SendD2LOrgDefinedId bit,
SendD2LOrgRoleId bit,
SendBrightspaceUserId bit,
Anonymous bit,
Shared bit,
UseToolProviderSecuritySettings bit,
LastModifiedDate datetime,
OuAvailabilitySetId bigint,
LastModifiedBy int,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Organizational_Units')
CREATE TABLE Organizational_Units (
OrgUnitId int,
Organization nvarchar (50),
Type nvarchar (50),
Name nvarchar (128),
Code nvarchar (50),
StartDate datetime,
EndDate datetime,
IsActive bit,
CreatedDate datetime,
IsDeleted bit,
DeletedDate datetime,
RecycledDate datetime,
Version bigint,
OrgUnitTypeId int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Organizational_Unit_Ancestors')
CREATE TABLE Organizational_Unit_Ancestors (
OrgUnitId int,
AncestorOrgUnitId int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Organizational_Unit_Descendants')
CREATE TABLE Organizational_Unit_Descendants (
OrgUnitId int,
DescendantOrgUnitId int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Organizational_Unit_Parents')
CREATE TABLE Organizational_Unit_Parents (
OrgUnitId int,
ParentOrgUnitId int,
RowVersion bigint,
DateDeleted datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Organizational_Unit_Recent_Access')
CREATE TABLE Organizational_Unit_Recent_Access (
OrgUnitId int,
UserId int,
LastAccessedDate datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Outcome_Details')
CREATE TABLE Outcome_Details (
OutcomeId nvarchar (16),
OutcomeDefinitionSource nvarchar (1000),
OutcomeDefinitionId nvarchar (128),
ParentOutcomeId nvarchar (16),
Description nvarchar (1000),
Notation nvarchar (1000),
CreatedDate datetime,
CreatedBy int,
LastModifiedDate datetime,
LastModifiedBy int,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Outcomes_Aligned_to_Tool_Objects')
CREATE TABLE Outcomes_Aligned_to_Tool_Objects (
ObjectType int,
ObjectId nvarchar (255),
OutcomeId nvarchar (16),
RegistryId nvarchar (16),
CreatedDate datetime,
CreatedBy int,
LastModifiedDate datetime,
LastModifiedBy int,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Outcomes_Assessed_Checkpoints')
CREATE TABLE Outcomes_Assessed_Checkpoints (
CheckpointId nvarchar (16),
DemonstrationId nvarchar (16),
Feedback nvarchar (1000),
ConfigDecayRate int,
ConfigAggregationMethod int,
ConfigIncludedActivities int,
ConfigMultipleAttemptStrategy int,
ConfigRecentlyAssessedActivityCount int,
ConfigTieBreaker int,
LastModifiedDate datetime,
LastModifiedBy int,
IsDeleted bit,
HasMetAchievementThreshold bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Outcomes_Course_Specific_Scales')
CREATE TABLE Outcomes_Course_Specific_Scales (
OrgUnitId int,
RegistryId nvarchar (16),
ScaleId nvarchar (16),
AchievementThreshold nvarchar (16),
CreatedDate datetime,
LastModifiedDate datetime,
LastModifiedBy int,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Outcomes_Demonstrations')
CREATE TABLE Outcomes_Demonstrations (
DemonstrationId nvarchar (16),
ExplicitlyEnteredScaleLevelId nvarchar (16),
AutomaticallyGeneratedScaleLevelId nvarchar (16),
AlignedObjectType int,
AlignedObjectId nvarchar (1000),
OutcomeId nvarchar (16),
RegistryId nvarchar (16),
IsPublished bit,
AssessedUserId int,
AssessedDate datetime,
AssessorUserId int,
LastModifiedDate datetime,
LastModifiedBy int,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Outcomes_in_Registries')
CREATE TABLE Outcomes_in_Registries (
OutcomeId nvarchar (16),
RegistryId nvarchar (16),
CreatedDate datetime,
CreatedBy int,
LastModifiedDate datetime,
LastModifiedBy int,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Outcomes_Program_Details')
CREATE TABLE Outcomes_Program_Details (
ProgramId bigint,
ProgramName nvarchar (1000),
OrgUnitId int,
CreatedDate datetime,
CreatedBy int,
LastModifiedDate datetime,
LastModifiedBy int,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Outcomes_Registry_Owners')
CREATE TABLE Outcomes_Registry_Owners (
OwnerType int,
OwnerId nvarchar (255),
RegistryId nvarchar (16),
CreatedDate datetime,
CreatedBy int,
LastModifiedDate datetime,
LastModifiedBy int,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Outcomes_Rubric_Alignments')
CREATE TABLE Outcomes_Rubric_Alignments (
RubricId bigint,
CriterionId bigint,
OutcomeId nvarchar (16),
RegistryId nvarchar (16),
CreatedDate datetime,
CreatedBy int,
LastModifiedDate datetime,
LastModifiedBy int,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Outcomes_Scale_Definition')
CREATE TABLE Outcomes_Scale_Definition (
ScaleId nvarchar (16),
Name nvarchar (1000),
IsDefault bit,
UsePercentages bit,
CreatedDate datetime,
CreatedBy int,
LastModifiedDate datetime,
LastModifiedBy int,
IsDeleted bit,
RegistryId nvarchar (16),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Outcomes_Scale_Level_Definition')
CREATE TABLE Outcomes_Scale_Level_Definition (
ScaleLevelId nvarchar (16),
ScaleId nvarchar (16),
Name nvarchar (1000),
SortOrder int,
PercentageRangeStart int,
RGB nvarchar (40),
CreatedDate datetime,
CreatedBy int,
LastModifiedDate datetime,
LastModifiedBy int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Portfolio_Categories')
CREATE TABLE Portfolio_Categories (
CategoryId nvarchar (16),
OrgUnitId int,
Name nvarchar (256),
IsRetired bit,
IsDeleted bit,
LastModified datetime,
LastModifiedBy int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Portfolio_Evidence_Categories')
CREATE TABLE Portfolio_Evidence_Categories (
CategoryId nvarchar (16),
EvidenceId nvarchar (16),
[Group] nvarchar (30),
IsDeleted bit,
LastModified datetime,
LastModifiedBy int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Portfolio_Evidence_Log')
CREATE TABLE Portfolio_Evidence_Log (
LogId nvarchar (16),
ParentObjectId nvarchar (16),
ObjectId nvarchar (16),
ObjectType nvarchar (40),
UserId int,
OrgUnitId int,
Action nvarchar (16),
IsMobile bit,
ActionDate datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Portfolio_Evidence_Objects')
CREATE TABLE Portfolio_Evidence_Objects (
EvidenceId nvarchar (16),
OwnerId int,
OrgUnitId int,
EvidenceType nvarchar (30),
Title nvarchar (1000),
IsApproved bit,
IsSpotlighted bit,
IsSharedToParents bit,
IsDeleted bit,
IsRecoverableByInstructor bit,
LastModified datetime,
LastModifiedBy int,
IsSharedWithInstructor bit,
DateSharedWithInstructor datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Question_Library')
CREATE TABLE Question_Library (
QuestionId bigint,
QuestionVersionId bigint,
IsAutoGraded bit,
TemplateTypeId int,
QuestionType nvarchar (28),
Name nvarchar (256),
Question nvarchar (1000),
Comment nvarchar (1000),
AnswerKey nvarchar (1000),
CreationDate datetime,
Version bigint,
AllowsAttachments bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Question_Relationships')
CREATE TABLE Question_Relationships (
CollectionId bigint,
QuestionId bigint,
QuestionVersionId bigint,
[Order] bigint,
SectionId bigint,
IsQuestionPool bit,
CreationDate datetime,
CreatedBy bigint,
LastModified datetime,
LastModifiedBy bigint,
Points float,
Difficulty int,
IsBonus bit,
IsMandatory bit,
IsDeleted bit,
Version bigint,
ObjectId bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Quiz_Attempts')
CREATE TABLE Quiz_Attempts (
AttemptId bigint,
QuizId bigint,
UserId int,
OrgUnitId int,
AttemptNumber int,
TimeStarted datetime,
TimeCompleted datetime,
Score float,
IsGraded bit,
OldAttemptNumber int,
IsDeleted bit,
PossibleScore float,
IsRetakeIncorrectOnly bit,
DueDate datetime,
TimeLimit int,
TimeLimitEnforced bit,
TimeLimitExceededBehaviour nvarchar (128),
IsSynchronous bit,
DeductionPercentage int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Quiz_Attempts_Log')
CREATE TABLE Quiz_Attempts_Log (
LogId bigint,
AttemptId bigint,
EventTypeId int,
Name nvarchar (256),
Description nvarchar (256),
EventTime datetime,
IPAddress nvarchar (15),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Quiz_Objects')
CREATE TABLE Quiz_Objects (
QuizId bigint,
QuizName nvarchar (256),
QuizDescription nvarchar (1000),
QuizCategory nvarchar (256),
IsActive bit,
OrgUnitId int,
StartDate datetime,
EndDate datetime,
DueDate datetime,
CreationDate datetime,
CreatedBy bigint,
LastModified datetime,
LastModifiedBy bigint,
GradeObjectId bigint,
OverallScoreCalculation nvarchar (23),
QuizScoreDenominator float,
HasPassword bit,
IPRestricted bit,
TimeLimit int,
TimeLimitEnforced bit,
AttemptsAllowed int,
PreventMovingBackwards bit,
AllowHints bit,
NotificationEmail nvarchar (1000),
DisablePagerAccess bit,
DisplayInCalendar bit,
IsAttemptRldb bit,
IsSubviewRldb bit,
SortOrder int,
CategoryId bigint,
ResultId bigint,
IsRetakeIncorrectOnly bit,
PagingTypeId int,
IsSynchronous bit,
DeductionPercentage int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Quiz_Question_Answer_Options')
CREATE TABLE Quiz_Question_Answer_Options (
AnswerId bigint,
AnswerText nvarchar (1000),
Weight float,
QuestionId bigint,
QuestionVersionId bigint,
QuizObjectId bigint,
AnswerOptionId bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Quiz_Question_Answers')
CREATE TABLE Quiz_Question_Answers (
AnswerId bigint,
QuestionId bigint,
QuestionVersionId bigint,
SortOrder int,
IsCorrect bit,
Weight float,
Answer nvarchar (1000),
Comment nvarchar (1000),
Description nvarchar (256),
ObjectId bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Quiz_Survey_Sections')
CREATE TABLE Quiz_Survey_Sections (
CollectionId bigint,
SectionId bigint,
Name nvarchar (256),
NameIsDisplayed bit,
IsQuestionPool bit,
SectionText nvarchar (1000),
SectionTextIsHTML bit,
IsSectionTextHidden bit,
QuestionPoints float,
NumQuestions int,
NumChoices int,
Shuffle bit,
CreationDate datetime,
CreatedBy bigint,
LastModified datetime,
LastModifiedBy bigint,
IsDeleted bit,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Quiz_User_Answer_Responses')
CREATE TABLE Quiz_User_Answer_Responses (
AttemptId bigint,
AttemptNumber int,
QuestionId bigint,
QuestionVersionId bigint,
AnswerId bigint,
SortOrder int,
IsCorrect bit,
UserSelection bigint,
UserAnswer nvarchar (1000),
FileSetId bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Quiz_User_Answers')
CREATE TABLE Quiz_User_Answers (
AttemptId bigint,
QuestionId bigint,
QuestionVersionId bigint,
TimeCompleted datetime,
QuestionNumber int,
Comment nvarchar (1000),
SortOrder int,
Score float,
Page int,
SectionId bigint,
ObjectId bigint,
OutOf float,
TimeStarted datetime,
IsBonus bit,
IsDeleted bit,
LastModified datetime,
LastModifiedBy int,
QuizTimeCompleted datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'PreRequisite_Conditions_Met')
CREATE TABLE PreRequisite_Conditions_Met (
PreRequisiteId int,
UserId int,
DateMet datetime,
Action nvarchar (7),
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Release_Condition_Objects')
CREATE TABLE Release_Condition_Objects (
PreRequisiteId int,
ResultId int,
OrgUnitId int,
Name nvarchar (64),
IsNegativeCondition bit,
PreRequisiteToolId int,
Id1 int,
Id2 int,
ResultToolId int,
UsesPercentage bit,
OperatorTypeDesc nvarchar (3),
Version bigint,
Guid1 nvarchar (16),
Guid2 nvarchar (16),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Release_Condition_Results')
CREATE TABLE Release_Condition_Results (
ResultId int,
UserId int,
Met nvarchar (7),
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Role_Details')
CREATE TABLE Role_Details (
RoleId int,
RoleName nvarchar (120),
Description nvarchar (400),
IsCascading bit,
InClassList bit,
ClassListRoleName nvarchar (120),
ClassListShowGroups bit,
ClassListShowSections bit,
ClassListDisplayRole bit,
AccessInactiveCO bit,
HasSpecialAccess bit,
AddToCourseOfferingGroups bit,
CanBeAutoEnrolledIntoGroups bit,
AddToCourseOfferingSections bit,
CanBeAutoEnrolledIntoSections bit,
AccessPastCourses bit,
AccessFutureCourses bit,
SortOrder int,
ShowInContent bit,
ShowInDiscussionAssess bit,
ShowInDiscussionStats bit,
ShowInGrades bit,
ShowInAttendance bit,
AllowSelfEnrollInGroups bit,
ShowInRegistration bit,
ShowInUserProgress bit,
RoleAlias nvarchar (120),
RoleCode nvarchar (100),
LastModifiedDate datetime,
DeletedBy int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Rubric_Assessment')
CREATE TABLE Rubric_Assessment (
RubricId bigint,
OrgUnitId int,
UserId int,
Score float,
AssessedByUserId int,
AssessmentDate datetime,
IsCompleted bit,
ActivityType nvarchar (50),
ActivityObjectId bigint,
DateCreated datetime,
AssessmentId bigint,
LevelAchievedId bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Rubric_Assessment_Criteria')
CREATE TABLE Rubric_Assessment_Criteria (
AssessmentId bigint,
UserId int,
RubricId bigint,
Score float,
Feedback nvarchar (1000),
IsScoreOverridden bit,
CriterionId bigint,
LevelAchievedId bigint,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Rubric_Criteria_Levels')
CREATE TABLE Rubric_Criteria_Levels (
RubricId bigint,
CriterionId bigint,
Description nvarchar (1000),
Feedback nvarchar (1000),
Value float,
LevelId bigint,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Rubric_Objects')
CREATE TABLE Rubric_Objects (
RubricId bigint,
Name nvarchar (256),
RubricStatus nvarchar (256),
Description nvarchar (1000),
RubricType nvarchar (256),
ScoringMethods nvarchar (256),
IsScoreVisible bit,
OrgUnitID int,
IsShared bit,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Rubric_Object_Criteria')
CREATE TABLE Rubric_Object_Criteria (
RubricId bigint,
CriterionId bigint,
Name nvarchar (256),
SortOrder int,
CriteriaGroupId bigint,
GroupName nvarchar (256),
GroupSortOrder int,
LevelSetId bigint,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Rubric_Object_Levels')
CREATE TABLE Rubric_Object_Levels (
RubricId bigint,
LevelId bigint,
Name nvarchar (256),
Description nvarchar (1000),
Feedback nvarchar (1000),
Value float,
RangeStartValue float,
SortOrder int,
LevelSetId bigint,
IsDeleted bit,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Rubrics_Edit')
CREATE TABLE Rubrics_Edit (
AuditLogId nvarchar (16),
RubricId bigint,
CriterionId bigint,
LevelId bigint,
ModifiedBy int,
ModifiedObjectType int,
CriteriaGroupId bigint,
ModifiedDate datetime,
PreviousValue nvarchar (4000),
ModifiedValue nvarchar (4000),
IsLocked bit,
Version int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Session_History')
CREATE TABLE Session_History (
SessionId bigint,
OrgId int,
UserId int,
DateStarted datetime,
DateEnded datetime,
LastAccessed datetime,
TimedOut bit,
HistoryID bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SCORM_Activities')
CREATE TABLE SCORM_Activities (
ActivityId nvarchar (16),
ScormObjectId nvarchar (16),
ParentActivityId nvarchar (16),
NumChildren int,
InternalId nvarchar (255),
Title nvarchar (200),
CompletionThreshold float,
PassingScore float,
PassingScoreUsed bit,
ScoreMin float,
ScoreMax float,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SCORM_Activity_Attempts')
CREATE TABLE SCORM_Activity_Attempts (
VisitId nvarchar (16),
ActivityId nvarchar (16),
AttemptNumber int,
Completion nvarchar (100),
Success nvarchar (100),
Score float,
ScoreRaw float,
TimeSpent float,
Progress float,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SCORM_Interaction_Attempts')
CREATE TABLE SCORM_Interaction_Attempts (
VisitId nvarchar (16),
InteractionId nvarchar (16),
AttemptNumber int,
ActivityId nvarchar (16),
Timestamp datetime,
Response nvarchar (1000),
Result nvarchar (100),
NumericResult float,
TimeSpent float,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SCORM_Interaction_Objectives')
CREATE TABLE SCORM_Interaction_Objectives (
InteractionId nvarchar (16),
ObjectiveId nvarchar (16),
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SCORM_Interactions')
CREATE TABLE SCORM_Interactions (
InteractionId nvarchar (16),
ActivityId nvarchar (16),
InternalId nvarchar (255),
InteractionType nvarchar (100),
Description nvarchar (250),
Weighting float,
CorrectResponses nvarchar (2000),
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SCORM_Objective_Attempts')
CREATE TABLE SCORM_Objective_Attempts (
VisitId nvarchar (16),
ObjectiveId nvarchar (16),
AttemptNumber int,
Score float,
ScoreRaw float,
Success nvarchar (100),
Completion nvarchar (100),
Progress float,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SCORM_Objectives')
CREATE TABLE SCORM_Objectives (
ObjectiveId nvarchar (16),
ScormObjectId nvarchar (16),
ObjectiveType nvarchar (100),
ActivityId nvarchar (16),
InternalId nvarchar (255),
IsPrimary bit,
Description nvarchar (250),
ScoreMin float,
ScoreMax float,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SCORM_Objects')
CREATE TABLE SCORM_Objects (
ScormObjectId nvarchar (16),
OrgUnitId int,
ContentObjectId int,
ContentServiceContentId nvarchar (16),
ContentServiceRevisionId nvarchar (16),
ContentServiceTopicId nvarchar (16),
Title nvarchar (1000),
Description nvarchar (1000),
LearningStandard nvarchar (100),
LastModified datetime,
LastModifiedBy int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SCORM_Visits')
CREATE TABLE SCORM_Visits (
VisitId nvarchar (16),
ScormObjectId nvarchar (16),
UserId int,
OrgUnitId int,
FirstAccessDate datetime,
LastAccessDate datetime,
CompletedDate datetime,
Completion nvarchar (100),
Success nvarchar (100),
Score float,
TimeSpent int,
Progress float,
LastModified datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SIS_Course_Merge_Log')
CREATE TABLE SIS_Course_Merge_Log (
BatchId nvarchar (16),
JobType nvarchar (32),
Status nvarchar (32),
OriginalTargetOrgUnitId bigint,
OriginalSourceOrgUnitId bigint,
SourceSystemId bigint,
NumberOfCoursesInBatch int,
UserId bigint,
ErrorType nvarchar (48),
Timestamp datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Quiz_Survey_Sections_')
CREATE TABLE Quiz_Survey_Sections_ (
CollectionId bigint,
SectionId bigint,
Name nvarchar (256),
NameIsDisplayed bit,
IsQuestionPool bit,
SectionText nvarchar (1000),
SectionTextIsHTML bit,
IsSectionTextHidden bit,
QuestionPoints float,
NumQuestions int,
NumChoices int,
Shuffle bit,
CreationDate datetime,
CreatedBy bigint,
LastModified datetime,
LastModifiedBy bigint,
IsDeleted bit,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Survey_Attempts')
CREATE TABLE Survey_Attempts (
AttemptId bigint,
SurveyId bigint,
UserId int,
OrgUnitId int,
AttemptNumber int,
TimeStarted datetime,
TimeCompleted datetime,
AttemptedFromOrgUnitId int,
OldAttemptNumber int,
IsDeleted bit,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Survey_Objects')
CREATE TABLE Survey_Objects (
SurveyId bigint,
SurveyName nvarchar (1000),
CategoryId bigint,
OrgUnitId int,
Description nvarchar (1000),
DescriptionEnabled bit,
HasInstantFeedback bit,
IsAnonymous bit,
IsVisible bit,
SubmissionMessage nvarchar (1000),
Footer nvarchar (1000),
FooterIsDisplayed bit,
StartDate datetime,
EndDate datetime,
DisplayInCalendar bit,
ResultId bigint,
AttemptsAllowed int,
SortOrder int,
CreatedBy int,
IsDeleted bit,
LastModified datetime,
LastModifiedBy int,
Version bigint,
CategoryName nvarchar (256),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Survey_Question_Answers')
CREATE TABLE Survey_Question_Answers (
AnswerId bigint,
QuestionId bigint,
QuestionVersionId bigint,
SortOrder int,
IsCorrect bit,
Weight float,
Answer nvarchar (1000),
Comment nvarchar (1000),
Description nvarchar (256),
SurveyObjectId bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Survey_User_Answer_Responses')
CREATE TABLE Survey_User_Answer_Responses (
AttemptId bigint,
AttemptNumber int,
QuestionId bigint,
QuestionVersionId bigint,
AnswerId bigint,
SortOrder bigint,
IsCorrect bit,
UserSelection bigint,
UserAnswer nvarchar (1000),
FileSetId bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Survey_User_Answers')
CREATE TABLE Survey_User_Answers (
AttemptId bigint,
QuestionId bigint,
QuestionVersionId bigint,
TimeCompleted datetime,
QuestionNumber int,
Comment nvarchar (1000),
SortOrder int,
Score float,
Page int,
Assigned bit,
IsDeleted bit,
LastModified datetime,
LastModifiedBy int,
SurveyTimeCompleted datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Tools')
CREATE TABLE Tools (
ToolId int,
Name nvarchar (50),
DisplayName nvarchar (200),
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Auditor_Relationships_Log')
CREATE TABLE Auditor_Relationships_Log (
AuditorId int,
UserToAuditId int,
OrgUnitId int,
Action nvarchar (16),
ModifiedBy int,
ModifiedDate datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Course_Access')
CREATE TABLE Course_Access (
OrgUnitId int,
UserId int,
DayAccessed datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Course_Access_Log')
CREATE TABLE Course_Access_Log (
OrgUnitId int,
UserId int,
Timestamp datetime,
Source nvarchar (20),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Enrollments_and_Withdrawals')
CREATE TABLE Enrollments_and_Withdrawals (
LogId bigint,
UserId int,
OrgUnitId int,
RoleId int,
Action nvarchar (50),
ModifiedByUserId int,
EnrollmentDate datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'User_Attribute_Definitions')
CREATE TABLE User_Attribute_Definitions (
AttributeId nvarchar (128),
Name nvarchar (128),
Type nvarchar (8),
AllowMultiple bit,
IsDefault bit,
LastModified datetime,
ModifiedBy int,
IsDeleted bit,
Version bigint,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'User_Attribute_Values')
CREATE TABLE User_Attribute_Values (
UserId int,
AttributeId nvarchar (128),
Value nvarchar (4000),
LastModified datetime,
ModifiedBy int,
IsDeleted bit,
Version int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'User_Enrollments')
CREATE TABLE User_Enrollments (
OrgUnitId int,
UserId int,
RoleName nvarchar (60),
EnrollmentDate datetime,
EnrollmentType nvarchar (50),
RoleId int,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'User_Logins')
CREATE TABLE User_Logins (
UserId int,
UserName nvarchar (256),
IP nvarchar (64),
SessionId int,
StatusType nvarchar (50),
AttemptDate datetime,
ImpersonatingUserId int,
LoginAttemptId nvarchar (36),
LoginSource nvarchar (50),

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
CREATE TABLE Users (
UserId int,
UserName nvarchar (270),
OrgDefinedId nvarchar (256),
FirstName nvarchar (64),
MiddleName nvarchar (64),
LastName nvarchar (64),
IsActive bit,
Organization nvarchar (256),
ExternalEmail nvarchar (256),
SignupDate datetime,
FirstLoginDate datetime,
Version bigint,
OrgRoleId int,
LastAccessed datetime,

);
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Virtual_Classroom_Usage')
CREATE TABLE Virtual_Classroom_Usage (
OrgUnitId int,
CourseName nvarchar (255),
MeetingId nvarchar (36),
MeetingName nvarchar (255),
CreationUserId int,
CreationDate datetime,
ScheduledDate datetime,
ScheduledDuration int,
IsPublished bit,
ExternalLinksEnabled bit,
WholeClassInvited bit,
IsCancelled bit,
StartDateTime datetime,
EndDateTime datetime,
IsRecorded bit,

);
GO
