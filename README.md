# App
Flutter application

## Project 
What does the project do?
Communicates with a robot to send drive commands and recieve sensor data through a bluetooth connection. The application also communicates with an API to visualize the driving path. 

Why the project is useful?
to be able to manually control the mower, and get a visualized representation of how the mower has moved. 


## Project instruction
### Starting the application:
1. Make sure you have an iphone or android phone available.
2. Start the app by pressing the icon on the screen
3. Turn on bluetooth and GPS on your phone.
4. Search for bluetooth devices in order to find the mower.
5. Connect to mower

### Flutter:  
1. Install Flutter 
2. Setup IDE
3. Follow the instructions in the flutter documentation guide: https://flutter.dev/docs/get-started/install

## Requirements
### A 1.0: Setup code structure / layout
#### Low level requirement
1. Setup project requirements.
2. Design mockups.

3. Implement design specifications.

### A 1.1: The App shall establish a wireless connection with the Robot.  
#### Low level requirement
1. Bluetooth   
  1.1 Search   
  1.2 Connect   
  1.3 Test  

2. Implemented bluetooth views
  2.1 Bluetooth permission view 
  2.2 Bluetooth search / list of devices

### A 1.2: The App shall take user input and translate this to drive commands passed to the Robot.  
#### Low level requirement
1. Setup controlMower view
  1.1 Design layout
  1.2 Implemented functionality

2. Handle user input

3. Send driver commands with bluetooth

### A 1.3: The App shall visualize sensor data from the collision avoidance sensor on the Mower.  
#### Low level requirement  
1. Setup collisionView 
  1.1 Design layout
  1.2 Implemented functionality

2. Handle Bluetooth data.
  2.1 display data 


## Application Diagram

![Flutter_app](https://user-images.githubusercontent.com/27735984/118472546-3d8a6200-b709-11eb-8b92-bb79d9676be9.png)



