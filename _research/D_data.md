---
title: Data Strategy
link: https://github.com/AdaptiveCity/acp_web
contact_name: Ian Lewis
contact_link: https://www.cl.cam.ac.uk/~ijl20
image: data_strategy.png
---

<p>We are taking a comprehensive approach in managing building and urban data in the following areas:
</p>
<dl>
    <dt>Sensor readings</dt>
    <dd>These are spatio-temporal, i.e. usually associated with a <i>time</i> and <i>location</i>
        in the building or urban region
        but also possibly associated with a managed asset. We collect this data into a historical
        archive but also pump it through our stream processing platform such that analysis can
        take place in real-time.</dd>

    <dt>Sensor metadata</dt>
    <dd>We need to manage 'reference data' for the <i>sensors</i> and the <i>sensor types</i>,
        e.g. to record where stationary sensors have been placed and to help interpret the
        data the sensors are sending. Our approach is to be <i>flexible</i> i.e. it remains possible
        to integrate a sensor into the system with the absolute minimum of information, but that
        assumes the ultimate recipient of the data will have the knowledge of how to interpret it.
    </dd>

    <dt>BIM data</dt>
    <dd>We use this term to mean the <i>relatively</i> static data representing 'assets' in a building or
        urban region, such as might be stored in IFC [<a href="https://en.wikipedia.org/wiki/Industry_Foundation_Classes">ref</a>].
        Storage methods and query tools for this data traditionally ignore the concept of <i>time</i> but
        note that the Adaptive City Platorm ensures all data is timestamped and the history maintained.
    </dd>

    <dt>Visual representation data</dt>
    <dd>A common requirement is to be able to <i>draw</i> a visual representation of the assets and sensors managed
        in the system and it is common (e.g. in IFC data) that the properties stored for a given asset are primarily
        useful to enable that asset (such as a concrete slab or pipe) to be drawn on a plan. On the Adaptive City Platform
        we separate the 'drawing' information into a dedicated API such that drawing common types of assets (e.g. building,
        floor, office, desk, microscope, sensor) can be generalized.
    </dd>
</dl>
