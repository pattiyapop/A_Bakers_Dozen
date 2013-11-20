#manually created this file
require 'rdoc/task'

Rake::RDocTask.new do |rdoc|
	rdoc.rdoc_files.include('README.md')
	rdoc.rdoc_files.include('app/*/*.rb')
	rdoc.main = "README.md"
	rdoc.title = "A Baker's Dozen Documentation"
	rdoc.rdoc_dir = 'rdoc'
end
