# Exploring Our Services

Our legacy monolith application uses Ruby on Rails with Spree Commerce to sell cool stuff. Our sales and marketing teams are eager to run advertisements and coupons to boost our sales. However, our deployment cycle is slow for our larger monolith store application. To support them in their mission to iterate on those changes quickly, we're going to create new advertising and discount services.

The marketing and sales teams both know Python pretty well, so they have built new web services using the [Flask](https://palletsprojects.com/p/flask/) framework.

Take a look at the [APM Services Map](https://app.datadoghq.com/apm/map) now to get a visual representation of our application cluster as it stands today.

Can you answer these questions using the APM Service Map?

1. How many web applications are there?
1. How many databases are there?
1. How many cache services are there?
1. How many requests are the services responding to?

Once you have done a little exploring and written down some answers to these questions, please let the instructor know you are ready before proceeding.
