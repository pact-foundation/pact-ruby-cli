desc 'Generate change log'
task :generate_changelog do
  require 'conventional_changelog'
  version = File.read('VERSION')
  ConventionalChangelog::Generator.new.generate! version: "v#{version}"
end

desc 'Tag for release'
task :tag_for_release do | t, args |
  command = "git tag -a v#{VERSION} -m \"chore(release): version #{VERSION}\" && git push origin v#{VERSION}"
  puts command
  puts `#{command}`
end
