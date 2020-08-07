# Testing for Resiliance

To make sure our new services work when the other teams perform their deploys, let's see what happens when things go wrong. Designing for resilience is a major factor when breaking up applications and we're about to see that first hand.

We're going to break a service by running the `break_service`{{execute}} command. When you do this, try to consider what your customers could or should be seeing once this drops.

Try to refresh your app after running the command:

[https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/](https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/)

Let's also look at Datadog to see if we can identify the outage in our [APM Services Map](https://app.datadoghq.com/apm/map). Not great right? We'll want to note this down for the development team in the incident report after this outage to let them know.

Let's bring everything back to normal again and run the `fix_service`{{execute}} command.
