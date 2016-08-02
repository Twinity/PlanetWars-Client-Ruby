task :default => :run

desc "Running tests..."
task :test do
  sh 'rspec "spec/spec_helper.rb"'
end

desc "Running the client..."
task :run do
  ruby "src/Main.rb"
end

desc "Running tests and then the app..."
task :tr do
  Rake::Task[:test].invoke
  Rake::Task[:run].invoke
end