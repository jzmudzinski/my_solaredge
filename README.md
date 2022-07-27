# MySolaredge

A ruby gem to connect to Solaredge's API. Use it to retrieve the latest or historical energy data for your solar panels.

It is aimed at individual consumers, who wish to monitor their own solar panels, rather than installers/vendors who may have access to multiple sites.

## Supported endpoints

The first 6 endpoints lists in the API documentation have been implemented.

- **sites** - Returns a list of sites related to the given token
- **energy** - Return the site energy measurements
- **time_frame_energy** - Return the site total energy produced for a given period
- **power** - Return the site power measurements in 15 minutes resolution (max 1 month at a time)
- **overview** - Display the site overview data. Handy if you want to replicate the summary data shown in the mobile app
- **energy_details** - Detailed site energy measurements from meters such as consumption, export (feed-in), import (purchase), etc.

## Installation

```ruby
gem install 'my_solaredge'
```

## Required credentials

To run the service, you will need an API Key. This can be obtained whilst logged in to [Solaredge's web application](https://monitoring.solaredge.com/).

Note there is a daily usage limit of around 300 calls per API key.

For most endpoints, you will need to know your site ID. This can be found via the `sites` endpoint.

It can also be provided alongside your API key when initializing the client. If it is not provided at this point, then it is assumed to be the first site ID from the `sites` endpoint. It is recommended to supply the site ID to save time & reduce un-necessary usage of the daily API quota.

## Usage

```ruby
  # Initializing the client
  credentials = { api_key: 'ABC123' } # add site_id: 456 to this when you have it
  solaredge = MySolaredge.new(credentials)

  # Retrieve hourly energy production
  energy = solaredge.energy(time_unit: :daily, start_date: '2022-02-14', end_date: Date.today)
  energy["values"].first # { "date" => <DateTime: 2022-7-24T00:00:00>, "value"=> nil }

  # Energy produced in given timeframe. Max 1 year
  solaredge.time_frame_energy(start_date: '01 Jan 2022', '31 Mar 2022').value # returns a decimal of the total Wh produced in that time period
```

## Features

- Credentials can be provided either as a hash or a link to a YAML file
- All parameters are in camel_case (Ruby standard)
- Input types are flexible: where date/datetimes are required you can use Strings, Dates or Datetimes, and where strings are required, either Strings or Symbols are accepted
- In the output, dates are automatically converted to Date/DateTime objects
- The API produces the somewhat unusual response of `{ "endpoint_name" => { useful_data} }`. This gem saves you time by only giving `useful_data` in the Response. If you want the raw HTTPary response object then use `.raw_response` on the Response object
- Some convenience methods on responses, like `value` on `time_frame_energy` in the above example

## Why create this gem?

Whilst there [already is a ruby gem](https://rubygems.org/gems/solaredge) to connect to Solaredge's API, it hasn't been updated since 2015, whereas the API has been updated several times since then. Additionally, that gem does not appear to state what license it is released under.

Plus I wanted to make a version that was easier to use.

## Contributing

There are more endpoints in the API that have not been implemented. Feel free to submit PR's for these, or you could raise an issue & I might implement it for you.

Bug reports and pull requests are welcome on GitHub at https://github.com/reedstonefood/my_solaredge.

## Useful links

- [Solaredge's monitoring service API documentation](https://solar.ece.ksu.edu/downloads/guides/SolarEdge.pdf)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
