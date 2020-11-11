---
title: ACP Decoders
link: https://github.com/AdaptiveCity/acp_local_mqtt
contact_name: John Adams
contact_link: https://www.cl.cam.ac.uk/~ijl20
image: acp_mqtt_decoders.png
---

Presence of multiple data sources arriving to a MQTT broker on the ACP architecture, it is important to have a framework to normalize/decode the data in the incoming messages and re-publish for consumption further downstream. The ACP Decoders project serves this purpose. Support is available to add decoders dynamically whenever needed without any interference with the main process. This is to support a typical IoT environment where new sensor types are added to the network with a data format not compatible with existing decoders for that network.
