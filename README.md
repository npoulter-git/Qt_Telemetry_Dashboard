# Qt Telemetry Dashboard Project
This project is a demonstrative Telemetry Dashboard UI

## Data Metrics Tracked
- Altitude
    - Elevation in meters
    - Graph tracking altitude over time
- Speed
    - Displayed in m/s
    - Graph tracking historical speed
- Roll / Pitch / Yaw
    - Just numbers initially, then expand
- Flight mode
- Position
    - Longitude
    - Latitude
    - Distance Away
- Active / Inactive (e.g. Armed)
- Battery Life (%, V, A)
- Vitals
    - Voltage
    - Current
    - Battery Temp
    - ESC Temp
    - CPU Temp
    - RSSI (Received Signal Strength Indicator)
    -Link Quality
- Sensors
    - GPS
    - IMU (Intertial Measurement Unit)
    - Barometer
    - Magnetometer
    - Accelerometer
    - Gyroscope
- Compass
    - Current direction visual
    - Degree direction (e.g. 134 SE)
- Messages / Alerts
- Flight Summary
    - Distance traveled
    - Max altitude
    - Flight Time
    - Average speed
    - Max speed
- System Status (%)
    - CPU Usage
    - Memory Usage
    - Disk Usage


## Screens / Tabs
NOTE: Will need to determine how to implement this
- Overview (home screen)
- Map (Maybe?)
- Flight Data
- Sensors
- System
- Logs
- Settings


## Custom Qt Components
- Graph Window
- Data Window (displays single data category e.g. altitude)
- Bar Chart Window
- Message List Window


## Data Simulator
- Will need to use some mechanism to generate data (updated at regular intervals)
- Update data and store locally, updated values are retrieved by the Dashboard instead of fed into it
- Can use data bindings to have values automatically update

## To Do Outline:
1. Create Data Window
2. Create Graph Window
3. Create Bar Chart Window
4. Create Message List Window (Note: all of the above use test data to start)
5. Create Home Screen with all of the Data Metric windows
6. Create C++ based simulation data generator 

## Stretch Goals
- Replay Mode: save and replay telemetry data
- Config File: Store settings in JSON, fetch/use/update these settings
- Telemetry Source Abstraction: Define an interface for providing telemetry data. Initially it is simulated but can be expanded to have a real device feed data in
