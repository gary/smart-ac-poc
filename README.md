# README

This README would normally document whatever steps are necessary to get the
application up and running. For brevity's sake, I assume you know your way
around bootstrapping a Rails application. Instead, I will outline what I
would have done had I had more time.

## Hindsight

Because I had to cut features on account of time constraints, here is a list (ordered by priority) of what I would improve and why:

* Stateful notifications (for CO and status warnings) need to be implemented in full.
  * _"Notifications are important because they will be a selling point of our service."_ For that reason they were also core functionality.

* Device search by serial number needs to be implemented in full.
  * This was core functionality.

* Listing devices needs more polish.
  * As explained in [`606fd8a`](https://github.com/gary/smart-ac-poc/commit/606fd8a80486cf44fd7039381e5346c3ada747d3), I opted to use the API endpoint for devices instead of displaying them in a more traditional manner. This was an intentional compromise to highlight the backend--whose implementation took the bulk of my time.

* The "view device details" feature needs more polish. Currently it is just a placeholder :unamused:
  *  Had there been more time, I would have used the [sensor readings API](https://github.com/gary/smart-ac-poc/blob/master/app/api/api.rb#L31-L46) endpoint in conjunction with a library like [d3](https://d3js.org/) or [chartkick](https://chartkick.com/) to satisfy this requirement.

* Full documentation for the API. I planned to leverage [`grape-swagger`](https://github.com/ruby-grape/grape-swagger) to generate [OpenAPI-compliant](https://swagger.io/specification/) documentation and [`apivore`](https://github.com/westfieldlabs/apivore) to validate it the as part of running the test suite.
  * This was a big requirement but I felt that fulfilling it via my plan made it low hanging fruit. For that reason I chose to lean on a combination of [`grape`](https://github.com/ruby-grape/grape)'s reader-friendly DSL, a good [test suite](https://github.com/gary/smart-ac-poc/blob/master/spec/requests/api_spec.rb), and minimal source-level documentation... and use the time elsewhere.

* Authentication for the API. I planned to stand up HTTP Basic Auth (builtin with grape) in such a way that it could be swapped for something more robust in the future.
  * I meant to stand up authentication for the API after establishing accounts for the system, but instead chose to prioritize making the admin web app look more visually polished. I did this because I felt that, for the purposes of selling the service, looks would be more noticeable than low-level authentication.

* A password reset/recovery workflow for accounts exists via Devise, but needs to be implemented.
  * Although this was also core functionality, it was not a show stopper for using the application so I chose to punt on it and focus on more priority features.

* Parameter definition/validation needs to be tightened for [`POST sensor-readings`](https://github.com/gary/smart-ac-poc/blob/master/app/api/api.rb#L48-L56).

* Account invitation via link needs to be implemented in full.
  * This feature was identified as a "nice to have" and was not given priority.

* Account blocking/re-enabling needs to be implemented in full.
  * This feature was also identified as a "nice to have" and was not given priority.
