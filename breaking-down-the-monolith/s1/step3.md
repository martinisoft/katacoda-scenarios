# Connecting The Dots

To better understand the implications of breaking apart your monolith or identify candidates for a microservice, we will instrument our services.

Datadog instrumentation allows us to get an immediate insight into what's going on with our software systems. Our code has already been set up with instrumentation and distributed tracing enabled by default.

Depending on the programming language your applications run in, you may have a different process for instrumenting your code. It's best to look at the [documentation](https://docs.datadoghq.com/tracing/setup/) for your specific language. Many of our integrations already enable distributed tracing out of the box so you may already have this running with your code now if you use Datadog APM.

## Instrumenting Ruby

Let's browse to the `store-frontend/config/initializers/datadog.rb` file to see that we have enabled the Rails APM integration:

```ruby
Datadog.configure do |c|
  # This will activate auto-instrumentation for Rails
  c.use :rails, {'analytics_enabled': true, 'service_name': 'store-frontend', 'cache_service': 'store-frontend-cache', 'database_service': 'store-frontend-sqlite'}
  # Make sure requests are also instrumented
  c.use :http, {'analytics_enabled': true, 'service_name': 'store-frontend'}
end
```

The `c.use :rails` and `c.use :http` lines automatically instrument our monolith ruby on rails storefront, but it also enables adding a special set of HTTP headers (`x-datadog-trace-id`, `x-datadog-parent-id`, `x-datadog-sampling-priority`) into the native HTTP library by default. This means any HTTP calls sent ore received in our code between our monolith and the advertising or coupon services will include our monolith's tracing identifiers which let us resume traces started in other applications for a given request.

## Instrumenting Python

Our two microservices which are in Python use a binary called `ddtrace-run` which is installed via the `ddtrace` Python package. Our docker configuration launches our Flask application with the `ddtrace-run` application which automatically injects the APM tracing libraries and also provides and listens for the special datadog tracing HTTP headers.

This sounds awesome, but we think during the development the sales and marketing teams might have turned off the distributed tracing option to debug some HTTP connectivity issues.

In the `ads-service/bootstrap.py` file you'll see something like the following at the bottom of the file.

```python
from ddtrace import config
config.flask['distributed_tracing_enabled'] = False
```

We'll want to delete these two lines because it disables the automatic detection of those incoming tracing IDs from our Rails application. Without it, we won't have complete end to end tracing from our Rails application to see where things could be going wrong.

In the `discounts-service/bootstrap.py` file you'll see something similar which we also want to delete before we restart the application.

```python
from ddtrace import config
config.flask['distributed_tracing_enabled'] = False
```

Now that we have cleaned that up, let's restart the services so we can start seeing a few traces. You can type or click on `application_reload`{{execute}} to do this now which will take a little time.
