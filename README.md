# URL Shortener

A simple URL shortener service built with Ruby on Rails that also generates usage reports for the application. The reports track the number of clicks, originating geolocation, and timestamp of each visit to a shortened URL.

## Installation

1. Clone the repository:
`git clone https://github.com/irisyann/url-shortener.git`

2. Install the required dependencies
`bundle install`

3. Create and setup the database
`rails db:create`
`rails db:migrate`

4. Start the Rails server
`rails server`

## Dependencies

- Ruby 3.1.3
- Rails 7.0.4.2
- PostgreSQL
- Geocoder - for retrieving the geolocation of a user
- Nokogiri - for retrieving the title tag of a target URL

## Deployment

This app is deployed on Heroku and uses a PostgreSQL database. 
You will need a Heroku account to deploy it yourself.

## Usage

Visit the root path and submit a target URL. The app will return a short URL and the title tag of the Target URL. It will also record the number of clicks to the short URL, the geolocation of the user, and the timestamp of the visit.
