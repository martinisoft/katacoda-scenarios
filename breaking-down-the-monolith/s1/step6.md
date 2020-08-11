# Testing for Resilience

One thing you have to be mindful of is the resilience of your microservices. The sales team just asked us to help them deploy a new version of their app with a killer discounts algorithm.

The sales team gave us a new deploy command to try, so let's run the `sales_deploy`{{execute T3}} command in a new terminal window.

Try to refresh your app after running the command:

https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/

Let's also look at Datadog to see if we can identify if the deploy worked in our [APM Services Map](https://app.datadoghq.com/apm/map). Not a great deploy right? We'll want to note this down for the development team in the incident report after to make some improvements to our app.

Let's bring everything back to normal again and run the `rollback_deploy`{{execute T3}} command.

Once you have run this, see if you can browse the store again and check in Datadog for the monitor status to resolve.
