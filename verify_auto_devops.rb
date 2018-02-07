#!/usr/bin/env ruby

require 'yaml'
require 'tempfile'

def extract_auto_devops_shell_script
  gitlab_ci_yml = YAML.load_file('Auto-DevOps.gitlab-ci.yml')
  auto_devops = gitlab_ci_yml['.auto_devops']
  if auto_devops.nil?
    STDERR.puts("Can't extract Auto-DevOps script")
    exit(2)
  end

  "#!/bin/bash\n\n#{auto_devops}"
end

def shellcheck
  file = Tempfile.new('shell')
  begin
    script = extract_auto_devops_shell_script

    file.write(script)
    file.close

    exit_code = system('shellcheck', '-s', 'bash', '-Calways', file.path)
    if exit_code.nil?
      STDERR.puts($?)
      exit_code = 2
    end

    exit(exit_code)
  ensure
    file.unlink
  end
end

shellcheck
