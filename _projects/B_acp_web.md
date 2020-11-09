---
title: ACP Web
link: https://github.com/AdaptiveCity/acp_web
contact_name: Ian Lewis
contact_link: https://www.cl.cam.ac.uk/~ijl20
image: github.png
---

acp_web is the 'http' interface to the Adaptive City Platform supporting
visualization of 'historical' and 'real-time' data. I.e. the web platform works with
both data held in storage (including the most recent) **and** streaming data flowing
through the platform. The latter is delivered via websockets to the browser.

The Adaptive City Platform has 'traditional' request-response restful API's over http
provided by ACP Web, as well as a real-time subscription API supported by the ACP Server
(see above).
