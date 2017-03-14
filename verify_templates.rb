require 'net/http'
require 'json'

uri = URI.parse 'https://gitlab.com/api/v3/ci/lint'

Dir.glob("#{File.dirname(__FILE__)}/**/*.yml").each do |file|
  response = Net::HTTP.post_form(uri, content: File.read(file))

  match = file.match(/(?<file>(\w|\+|#)+)\.gitlab-ci.yml/)
  template_name = match ? match[:file] : nil

  unless template_name
    puts "Invalid file format for #{file}"
    exit(1)
  end

  if JSON.parse(response.body)['status'] == 'valid'
    puts "\e[32mvalid\e[0m: #{file}" # Color 'valid' green
  else
    puts "invalid: #{file}"
    exit(1)
  end
end

# Given we test all the templates, the coverage is 100%, always. To showcase
# how this is done, we print it here. The regex to parse this would be:
# /Coverage:\s(d+)%/
puts "Coverage: 100%"
