desc 'Generate change log'
task :generate_changelog do
  require 'conventional_changelog'
  version = File.read('VERSION')
  ConventionalChangelog::Generator.new.generate! version: "v#{version}"
end

desc 'Tag for release'
task :tag_for_release do | t, args |
  version = File.read('VERSION')
  command = "git tag -a v#{version} -m \"chore(release): version #{version}\" && git push origin v#{version}"
  puts command
  puts `#{command}`
end
