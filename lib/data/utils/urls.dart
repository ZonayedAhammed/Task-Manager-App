class Urls{

Urls._();

  static const String _baseUrls = "https://task.teamrabbil.com/api/v1";
  static String registration =  "$_baseUrls/registration";
  static String login =  "$_baseUrls/login";
static String createTask =  "$_baseUrls/createTask";
static String taskStatusCount = "$_baseUrls/taskStatusCount";
static String NewTasks = "$_baseUrls/listTaskByStatus/New";
static String inProgressTasks = "$_baseUrls/listTaskByStatus/Progress";

}