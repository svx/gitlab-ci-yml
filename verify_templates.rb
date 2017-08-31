#!/usr/bin/env ruby

require 'net/http'
require 'json'

LINTER_URI = URI.parse 'https://gitlab.com/api/v4/ci/lint'

def verify(file)
  response = Net::HTTP.post_form(LINTER_URI, content: File.read(file))

  file = file.match(/((\w|\+|#)+)\.gitlab-ci/)[1]

  if JSON.parse(response.body)['status'] == 'valid'
    puts "\e[32mvalid\e[0m: #{file}" # Color 'valid' green
  else
    puts "invalid: #{file}"
    exit(1)
  end
end

if ARGV.empty?
  Dir.glob("#{File.dirname(__FILE__)}/**/*.yml").each { |file| verify(file) }

  # Given we test all the templates, the coverage is 100%, always. To showcase
  # how this is done, we print it here.
  puts 'Coverage: 100%'
else
  verify(ARGV[0])
end
