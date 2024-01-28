# Pi-Somfy HomeAssistant add-on
## Works with

Home Assistant

    Core 2024.1.5
    Supervisor 2023.12.1
    Operating System 11.4
    Frontend 20240104.0
    Alpine Linux 3.19
    
This repository contains minimal implementation allowing to run Pi-Somfy as a HASSIO add-on. 

1. Connect to your raspberry hassio host over ssh
2. `git clone https://github.com/muffel11/pi-somfy-hassio.git addons/somfy`
3. Navigate to `https://YOUR_HASSIO/hassio/store`
4. Enter the hidden menu in top right corner and choose `Refresh`. You should see "Local add-ons" section with "Somfy shutters" plugin
5. Install the plugin
6. Disable the protection mode
7. Start the plugin
8. Navigate to `https://YOUR_HASSIO:9909` and configure the shutters (configuration is persisted in `/config/shutters.conf`)

## TODO
* Make plugin less privileged (maybe `pigpio` could be ran without full access to everything)
* Debug MQTT connection

## Credits
Big thanks to https://github.com/Nickduino/Pi-Somfy for implementing the hard part (protocol and everything around)
