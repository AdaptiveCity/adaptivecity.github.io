---
title: ACP Decoders
link: https://github.com/AdaptiveCity/acp_local_mqtt
contact_name: Ian Lewis
contact_link: https://www.cl.cam.ac.uk/~ijl20
image: acp_mqtt_decoders.png
---

Given the heterogeneity of multiple data sources arriving at the Adaptive City Platform, it is important to have a framework to normalize/decode the data in the
incoming messages and re-publish for consumption further downstream. The ACP Decoders project serves this purpose. Support is available to add decoders dynamically
whenever needed without any interference with the main process. This is to support a typical IoT environment where new sensor types are added to the network with
a data format not compatible with existing decoders for that network. Although it may take specialized code further along the stream to correctly interpret a
particular reading, the decoders are designed to help the data on its way, e.g. the data will be decoded to a JSON format (and will always include any
original data base64-encoded if necessary) and identifiers and timestamps will be added to the message. These steps mean that much of the processing in the
platform can be relatively independent of the meaning of a particular reading, for example the websocket subscription support provided in acp_server.
