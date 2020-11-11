---
title: ACP MQTT
link: https://github.com/AdaptiveCity/acp_local_mqtt
contact_name: George Washington
contact_link: https://www.cl.cam.ac.uk/~ijl20
image: acp_local_mqtt.png
---

The ACP Local MQTT project achieves two crucial goals for the Adaptive City Platform. First, it creates a mosquitto bridge to retrieve sensor data from different network interfaces at a single mosquitto broker. Second, it provides a decoder framework which subscribes to incoming data form the mosquitto bridge and allows the dynamic addition of decoders capable of extracting and normalizing key properties such that the annotated data can be re-published for consumption further downstream on the ACP architecture like any other real-time data source.
