# Shelly Admin HomeAssistant Add-on

![Supports aarch64 Architecture](https://camo.githubusercontent.com/dd162ecbb0da6ee78fab7c278a1dba2c119748355209ef7df70ef2fbe0e9cb0b/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f616172636836342d7965732d677265656e2e737667) ![Supports amd64 Architecture](https://camo.githubusercontent.com/ce3c356720b2ae8a384979d7c8ed54b7086b3e88dbdd86678f98599477ffcbb2/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f616d6436342d7965732d677265656e2e737667) ![Supports armv7 Architecture](https://camo.githubusercontent.com/b9668a1002121b334b9920a2b7750d3ea2eb82d040323a7f8930c234b56f56ef/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f61726d76372d7965732d677265656e2e737667) ![Supports i386 Architecture](https://camo.githubusercontent.com/381b99aef5441b654e7356f2908b2d0f8646c5a7914b14f883c8fd3478912ebd/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f693338362d7965732d677265656e2e737667)

Handles discovery and communication with [Shelly](https://shelly.cloud) devices using [CoAP](http://coap.technology) over HTTP.

An administration console written to manage a whole network of Shellys and to enure that their configuration is homogenous. The user interface is entirely HTML5 and built upon Bootstrap 4 and Pug (née Jade) page templates.
![Early Shelly Admin UI Preview](https://github.com/maxlyth/hassio-addons/raw/main/shelly-admin/images/shelly-admin-ha-screenshot.png)
The applications, by design, does not work with or rely on Shelly Cloud. Device discovery is currently implemented via CoAP thanks to the awesome work of [Alexander Rydén](https://github.com/alexryd) for his contribution to the [Shellies](https://github.com/alexryd/node-shellies) NPM project. I fully intend to add MQTT discovery soon after the inital CoAP based release. I may also add IP range scanning if there is demand.

The user interface is designed to be dynamic and will automatically update in realtime as Shelly devices appear, change or go offline. Where possible this is acheived via push notifcations from each device using CoAP or MQTT but also falls back to the direct device API calls over http where push events are not supported.

This is prerelease software and is not yet feature complete. For ease of development this project is packaged as a NodeJS web server driving an HTML5 web browser (Safari, Chrome, Firefox, Edge etc). The stand-alone Electron versions to deliver native binaries on MacOS and Windows will follow closer to functional completion.

I am looking for interested parties that would like to collaborate, either with pull requests or end-user testing. Please contact me by [email](email:shellyadmin@lyth.name) if you want to be involved or have any questions.
