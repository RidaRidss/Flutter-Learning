# Flutter-Learning

#### step by step flutter learning

## step 1:
Install IDE Visual Studio Code or Intellij (my preference)
Install Git for Windows (I recommend Git Bash too)

## step 2:
Open CMD
Run `git clone -b master https://github.com/flutter/flutter.git`

## step 3:
Run `./flutter/bin/flutter --version` to ensure it has been installed successfully

## step 4:
Add `C:\Users\Rida\flutter\bin` to your Path environment variable

## step 5:
Restart CMD
Run `flutter doctor`

### step 5_1:
#### if you got this warning on cmd after run above command

Android toolchain - develop for Android devices (Android SDK version 28.0.3)! Some Android licenses not accepted.  To resolve this, run: flutter doctor --android-licenses

### step 5_2:
 `flutter doctor --android-licenses`

### step 5_3:
install flutter extension in VS code

### step 5_4:
open android studio , go to sdk manager , plugins -> install Dart plugin -> restart android studio

### step 5_5:
open android studio , go to sdk manager , plugins -> install F plugin -> restart android studio

### step 5_6:
set flutter sdk path in my case path is this 
`flutter config --android-sdk C:\Users\Rida\AppData\Local\Android\Sdk`

### step 5_7:
restart your editors

### step 5_8:
Run `flutter doctor` (now hopefully all warning will be removed)

# Start Coding by creating app

## baby steps

###### 1. `flutter create app_name`
###### 2. `yarn install` / `npm install`
###### 3. `flutter run`



# Ridss Quiz App

#### Happy Flutter :smile: :smile: