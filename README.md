# Verify Product Page

This is the source for https://www.verify.service.gov.uk/.

## Running Locally

If you wish to run in your own browser, you'll need to run the
following commands from the root of this project:

- `bundle install` to install middleman and its dependencies
- `npm install` to install the frontend dependencies
- `bundle exec middleman server` - to start middleman's built in server
- `open http://localhost:4567` - to open the example in your browser

## Development

This was originally based on the [product-page-example](https://github.com/alphagov/product-page-example), 
however it slightly diverged since that (custom styles, migration to GOV.UK Frontend),
but it still is possible to pull in more modules from the example repo.
