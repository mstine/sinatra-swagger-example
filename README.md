# Sinatra Swagger Example

This is an *very basic* Sinatra app that I set up in order to learn how to bootstrap a Swagger toolchain. It uses [source2swagger](https://github.com/solso/source2swagger) to generate the Swagger JSON.

## Usage:

    bundle install
    rackup

This will start a server at http://localhost:9292. If you hit that with your browser, you'll see the API documentation rendered via the Swagger UI.

If you'd like to toy around with the Sinatra app and expand the API, have fun. Don't forget to document your API changes, following the source2swagger specs.

To regenerate the API documentation, simply execute:

    rake

And refresh the page.


