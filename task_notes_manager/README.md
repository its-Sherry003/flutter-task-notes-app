# flutter-task-notes-app

Flutter assignment. Mobile Networks

Name : NAMEMBWA SHERRY
Student Number : 2300714586
Reg. No. : 23/U/14586/EVE

A brief description of the app.

1. Add tasks: Users can create tasks with
   -Title (required)
   -Description (optional)
   -Priority level (Low, Medium, High)
   -Completion status
2. View tasks: Displays all tasks in a scrollable list showing: Task title, description and delete button for each task
3. The application has a dark/Light theme Toogle on the home screen. It persists across app restarts.
4. Local storage: The app uses SQLite database to store permanently on the device.

Instructions on how to run the project.

1. Prerequisities:
   -Flutter SDK installed (flutter.dev)
   -Dart SDK (comes with flutter or you can download it manually)
   -An IDE(Android Studio or VS Code)
   -Android or IOS Emulator, or a physical device
2. Steps to run: Use a terminal "Power shell, CMD or bash"
   -Clone the repository run "git clone https://github.com/its-Sherry003/flutter-task-notes-app.git" then run "cd flutter-task-notes-app/task_notes_manager"
   -Install dependencies run "flutter pub get"
   -Check Flutter setup run "flutter doctor"
   -If no issues shown run "flutter run" for connected device or emulator
   -But for a specific device run "flutter devices" to list available devices then run "flutter run -d <device-id>"
