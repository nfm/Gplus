# Gplus: A Google+ API client library for Ruby

## Intro

The Google+ API was opened today (15th September 2011).

So far, there are two stub gems, `googleplus` and `google_plus`, both of which do literally nothing.

Lets work together to get Ruby on Google+ ASAP!

## Installation

gem install gplus

## Using the gem

To make requests, you need to [create an application](https://code.google.com/apis/console) with access to the Google+ API.

Next, [create an OAuth 2.0 client ID](http://code.google.com/apis/console#access). You'll need to pick a product name, an optional logo, and a domain to redirect to after authorization.

You can then specify additional redirect URIs and allowed javascript origins.

You'll need the Client ID and Client secret that are generated. Keep them secure!

Create a Google+ client:

    client = Gplus::Client.new(:client_id => 'YOUR_CLIENT_ID', :client_secret => 'YOUR_CLIENT_SECRET')
