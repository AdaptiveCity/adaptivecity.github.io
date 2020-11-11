---
title: Real-time platform design
link: https://github.com/AdaptiveCity/acp_server
contact_name:
contact_link:
image: acp_server.png
---

Our research has the <i>data streaming</i> as a central theme. I.e. our objective is that the real-time sensor data flows in from
the networks, is distributed around our various servers and workstations, and is analysed and visualised continuously. At the core
of the Adaptive City Platform is <a href="https://github.com/AdaptiveCity/acp_server">acp_server</a> which provides a high-performance
asynchronous message-passing development system based on <a href="https://vertx.io">Eclipse Vert.x</a>. The system is modular,
with some key components being <a href="https://github.com/AdaptiveCity/acp_server/tree/master/src/main/java/acp_server/feedmaker">FeedMaker</a>
which can receive data via HTTP,
<a href="https://github.com/AdaptiveCity/acp_server/tree/master/src/main/java/acp_server/feedmqtt">FeedMQTT</a> which performs a
similar function for MQTT data,
<a href="https://github.com/AdaptiveCity/acp_server/tree/master/src/main/java/acp_server/msgfiler">MsgFiler</a> which listens
to the messages streaming through the platform and stores that data as required,
<a href="https://github.com/AdaptiveCity/acp_server/tree/master/src/main/java/acp_server/RTMonitor">RTMonitor</a> which
subscribes to messages on behalf of downstream clients connected via websockets (i.e. particularly web pages), and
<a href="https://github.com/AdaptiveCity/acp_server/tree/master/src/main/java/acp_server/MsgRouter">MsgRouter</a> which can connect
one `acp_server` system to a `FeedMaker` on another server.

Our research into this urban/in-building real-time platform aims to provide a general framework into which real-time analysis
modules can be plugged. A key concept is this real-time analysis may produce derived messages (events) which then propagate
through the Adaptive City Platform with the same status as the original data from which the event was derived. We are particularly
interested in techniques generally applicable to sensor and event data (such as managing identifiers and timestamps effectively
and measuring latency) as well as investigating analysis techniques (such as pattern recognition) suitable for real-time
spatio-temporal data.
