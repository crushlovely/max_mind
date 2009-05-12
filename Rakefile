%w[rubygems rake rake/clean fileutils newgem rubigen].each { |f| require f }
require File.dirname(__FILE__) + '/lib/max_mind'

# Jeweler 1.0.0
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "heythisisnate-max_mind"
    gemspec.summary = "Ruby library for interacting with the MaxMind GeoIP Web Services"
    gemspec.email = "nate@nateclark.com"
    gemspec.homepage = "http://github.com/heythisisnate/max_mind"
    gemspec.description = "Ruby library for interacting with the MaxMind GeoIP Web Services"
    gemspec.authors = ["P J Kelly", "Nate Clark"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end


# # Generate all the Rake tasks
# # Run 'rake -T' to see list of generated tasks (from gem root directory)
# $hoe = Hoe.new('max_mind', MaxMind::VERSION) do |p|
#   p.developer('FIXME full name', 'FIXME email')
#   p.changes              = p.paragraphs_of("History.txt", 0..1).join("\n\n")
#   p.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
#   p.rubyforge_name       = p.name # TODO this is default value
#   # p.extra_deps         = [
#   #   ['activesupport','>= 2.0.2'],
#   # ]
#   p.extra_dev_deps = [
#     ['newgem', ">= #{::Newgem::VERSION}"]
#   ]
#   
#   p.clean_globs |= %w[**/.DS_Store tmp *.log]
#   path = (p.rubyforge_name == p.name) ? p.rubyforge_name : "\#{p.rubyforge_name}/\#{p.name}"
#   p.remote_rdoc_dir = File.join(path.gsub(/^#{p.rubyforge_name}\/?/,''), 'rdoc')
#   p.rsync_args = '-av --delete --ignore-errors'
# end

# require 'newgem/tasks' # load /tasks/*.rake
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# task :default => [:spec, :features]
