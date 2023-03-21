desc 'Generate change log'
task :generate_changelog do
  require 'conventional_changelog'
  require 'fileutils' # missing require in conventional_changelog
  require 'pact/cli/version'
  ConventionalChangelog::Generator.new.generate! version: "#{Pact::Cli::VERSION}.#{ENV.fetch('RELEASE', '0')}", force: true
end

desc 'Tag for release'
task :tag_for_release do | t, args |
  require 'pact/cli/version'
  version = "#{Pact::Cli::VERSION}.#{ENV.fetch('RELEASE', '0')}"
  command = "git tag -a #{version} -m \"chore(release): version #{version}\" && git push origin #{version}"
  puts command
  puts `#{command}`
end
