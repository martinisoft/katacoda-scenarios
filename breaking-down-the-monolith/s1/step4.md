# When Things Go Wrong

Our [APM Services Map](https://app.datadoghq.com/apm/map) would be even better with an indicator of their individual health. Not only will it help communicate services health to your team, but they can provide uniquely tailored troubleshooting steps for when alerts happen on any of the services.

1. Go to the APM -> Services link in Datadog
1. Click on the "discounts-service" in the list
1. At the top, you will see a blue outlined button that says "No Monitors or Synthetic Tests" to click
1. Next you will see a list of suggested monitors so let's enable the "Service discounts service has a high p90 latency on env:ruby-shop"

A great place to start with services when they are separated out is to keep an eye on network latency. Especially when these services cross regional or data center boundaries. Network performance and reliability will change how you think of software design and behavior with microservices.

## Testing for Resiliance

To make sure our new services work when the other teams perform their deploys, let's see what happens when things go wrong. Designing for resilience is a major factor when breaking up applications and we're about to see that first hand.

We're going to break a service by running the `break_service`{{execute}} command. When you do this, try to consider what your customers could or should be seeing once this drops.

Try to refresh your app after running the command:

    https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/

Let's also look at Datadog to see if we can identify the outage in our [APM Services Map](https://app.datadoghq.com/apm/map). Not great right? We'll want to note this down for the development team in the incident report after this outage to let them know.

Let's bring everything back to normal again and run the `fix_service`{{execute}} command.
