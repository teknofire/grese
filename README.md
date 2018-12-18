# Gather-logs REporter SErvice

Quick Sinatra app to accept remote requests to parse gather-log bundles

## Requirements

* Ruby (2.5+)
* Bundler
* Zendesk account info

## Installation

Setup `.env` with the necessary variables for zendesk and the required API token.

```
bundle install
```

## Running the service

```
source .env; bin/server
```
