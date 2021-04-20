# Shelly Admin HomeAssistant Add-on

![Supports aarch64 Architecture](https://camo.githubusercontent.com/dd162ecbb0da6ee78fab7c278a1dba2c119748355209ef7df70ef2fbe0e9cb0b/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f616172636836342d7965732d677265656e2e737667) ![Supports amd64 Architecture](https://camo.githubusercontent.com/ce3c356720b2ae8a384979d7c8ed54b7086b3e88dbdd86678f98599477ffcbb2/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f616d6436342d7965732d677265656e2e737667) ![Supports armv7 Architecture](https://camo.githubusercontent.com/b9668a1002121b334b9920a2b7750d3ea2eb82d040323a7f8930c234b56f56ef/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f61726d76372d7965732d677265656e2e737667) ![Supports i386 Architecture](https://camo.githubusercontent.com/381b99aef5441b654e7356f2908b2d0f8646c5a7914b14f883c8fd3478912ebd/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f693338362d7965732d677265656e2e737667)

Handles discovery and communication with [Shelly](https://shelly.cloud) devices using [CoAP](http://coap.technology) and CoIoT over HTTP.

An administration console written to manage a whole network of Shellys and to enure that their configuration is homogenous.

The user interface is entirely HTML5 and built upon Bootstrap 4 and Pug (née Jade) page templates. The design is fully responsive and reconfigures its layout dynamically so it is usuable even on a mobile device.
![Early Shelly Admin UI Preview](https://github.com/maxlyth/hassio-addons/raw/main/shelly-admin/images/shelly-admin-ha-screenshot.png)
By design the applications does not utilise or rely on Shelly Cloud. Device discovery is currently implemented via CoAP thanks to the awesome work of [Alexander Rydén](https://github.com/alexryd) for his contribution to the [Shellies](https://github.com/alexryd/node-shellies) NPM project. fully intend to add MQTT discovery soon after the inital CoAP based release. I may also add IP range scanning if there is demand.

The user interface is designed to be dynamic and will automatically update in realtime as Shelly devices appear, change or go offline. Where possible this is acheived via push notifcations from each device using CoAP but also falls back to the direct device API calls over http where push events are not supported.

Not only does the Add-on discover all your devices on the local network, it also allows you to update the firmware with a single click or open the device configuration page without messy tabs or navigation. The Add-on includes a reverse proxy so you can directly access the Shelly UI of each device even if you are not on the same network. This means if you have remote access to Home Assistant (eg via Nabu Casa, reverse proxy, port mapping etc) then you can also remotely access your Shelly devices.
![Early Shelly Admin UI Preview](https://github.com/maxlyth/hassio-addons/raw/main/shelly-admin/images/shelly-admin-ha-edit.png)

## Installation

The installation of this add-on is pretty straightforward and not different in comparison to installing any other Home Assistant add-on.

1. Navigate to Supervisor in side bar
2. Select Add-on Store tab
3. Click triple dot menu in top right and select Repositories
4. Paste 'https://github.com/maxlyth/hassio-addons' and click Add
5. Click Shelly Admin Add-On
6. Click Install
7. Ready to go!

## Known Limitations

This is prerelease software and is not yet feature complete. For ease of development this project is packaged as a NodeJS web server driving an HTML5 web browser (Safari, Chrome, Firefox, Edge etc). The stand-alone Electron versions to deliver native binaries on MacOS and Windows will follow closer to functional completion.

I am looking for interested parties that would like to collaborate, either with pull requests or end-user testing. Please contact me by [email](email:shellyadmin@lyth.name) if you want to be involved or have any questions.
