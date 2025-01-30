# LazyCalc - Simplistic Calculator App Interface

## Overview

LazyCalc is a minimalistic calculator app interface designed for both iOS and Android platforms. This project is part of the CS 458 UI Challenge. The primary goal is to create a simple calculator interface that rescales automatically to fit any reasonable phone display size supported by the IDE.

## Features

- **Basic Calculator Functions**: Includes a full decimal number pad along with buttons for basic operations such as addition, subtraction, multiplication, and division.
- **Rescaling Interface**: Automatically adapts to different device screen sizes ensuring a consistent layout across various devices.
- **Simple Layout**: The interface can either occupy the full screen or a deliberately sized subset of it, maintaining a neatly aligned grid of buttons.

## Project Structure

The project is structured as follows:

- `src`: Contains all the source files for the application.
- `res`: Includes resources such as images, layout definitions, and other assets.
- `AndroidManifest.xml` or `Info.plist`: System files for Android and iOS respectively, detailing the app’s setup and required permissions.

## Setup and Compilation

### For iOS

1. Open the `.xcodeproj` file in Xcode.
2. Build the project by pressing `Cmd + B`.
3. Run the app in the simulator or on a physical device by pressing `Cmd + R`.

## Testing

The interface should be tested on multiple device simulators in Xcode or Android Studio to ensure it scales correctly. The layout should remain visible and appropriately scaled regardless of the device used.


### iOS

- Navigate to the directory containing your Xcode project.
- Zip the folder containing the `.xcodeproj` file and its corresponding folder.

Submit the zip file via Canvas as instructed in the course.

## License

This project is licensed under the MIT License - see the `LICENSE` file for details.
