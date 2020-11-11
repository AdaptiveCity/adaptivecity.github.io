---
title: Heterogeneous sensor networking
link: https://github.com/AdaptiveCity/acp_local_mqtt
contact_name:
contact_link:
image: acp_mqtt_decoders.png
---

Data from sensors flows across many types of network structures and comes in many flavors, shapes and sizes. Often the original
source of the data is very limited in its capability or capacity. Nevertheless we want the data to be associated with a unique
identifier representing the source, a sensible timestamp representing the time the reading occurred, and the location of the
sensor at the time the reading was taken. Then the reading itself must be transported through our platform and interpreted for
a visualisation or analysis. Our research effort includes looking at the underlying networks, such as LoraWAN, Zigbee, WiFi and
ModBus, to see if optimisations can be applied allowing devices to communicate as intelligent nodes without necessarily all data
being sent to a central host. As the data enters the Adaptive City Platform we are generally wrapping the incoming
data in a JSON message. We have architected an <a href="https://github.com/AdaptiveCity/acp_local_mqtt">MQTT framework</a> which
propagates the data to a number of servers (and development workstations) for experimentation an analysis. A dynamic
<a href="https://github.com/AdaptiveCity/acp_local_mqtt/tree/master/acp_decoders">decoders</a> framework is used to interpret the
readings and add identifiers and timestamps where appropriate.
