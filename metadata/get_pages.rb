#!/usr/bin/env ruby

require 'json'

puts '>> Gets all the Wordpress pages for Lemonade Alley and outputs to JSON.'

json = JSON.pretty_generate(
  "pages" => [
    {"name" => "About", "url" => "http://lemonadealley.com/about/?json=1"},
    {"name" => "Competition", "url" => "http://lemonadealley.com/competition/?json=1"},
    {"name" => "Craft Fair", "url" => "http://lemonadealley.com/craft-fair/?json=1"},
    {"name" => "Sponsors", "url" => "http://lemonadealley.com/sponsors/?json=1"}
  ]
)

# Save a string to a file.
json_file = File.new("pages.json", "w")
json_file.write(json)
json_file.close
