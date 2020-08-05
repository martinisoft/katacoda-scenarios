# Exploring Our Services

Our legacy monolith application uses Ruby on Rails with Spree Commerce to sell cool stuff. Our marketing team is eager to run advertisements and coupons to boost our sales. To support them, we'll be introducing a coupon and advertising service so they can independently iterate on this service quickly.

The Marketing and Sales teams both know Python pretty well, so they have built new web services using the [Flask](https://palletsprojects.com/p/flask/) framework. They also instrumented the application in APM using the `ddtrace-run` command.

Let's take a look at the [APM Services Map](https://app.datadoghq.com/apm/map) to get a visual representation of our applications.

Take note of the following:

1. What are you noticing right away with this view?
1. What can you do in this view?
