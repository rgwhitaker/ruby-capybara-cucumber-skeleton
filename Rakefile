require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'json'
require 'yard'
require 'fileutils'

ADB_SERIAL = 'your_serial_number'.freeze

task :cleanup do
  puts ' ========Deleting old reports ang logs========='
  FileUtils.rm_rf('reports')
  File.delete('cucumber_failures.log') if File.exist?('cucumber_failures.log')
  File.new('cucumber_failures.log', 'w')
  Dir.mkdir('reports')
end

task :parallel_run do
  puts '===== Executing Tests in parallel'
  system 'bundle exec parallel_cucumber features/ -o "-p parallel -p pretty -t @regression"'
  puts ' ====== Parallel execution finished ========'
end

task :rerun do
  if File.size('cucumber_failures.log') == 0
    puts '==== No failures. Everything Passed ========='
  else
    puts ' =========Re-running Failed Scenarios============='
    system 'bundle exec cucumber @cucumber_failures.log -f pretty'
  end
end

task parallel_cucumber: [:cleanup, :parallel_run]

Cucumber::Rake::Task.new(:selenium) do |t|
  t.cucumber_opts = 'features -p selenium --format pretty --profile html -t ~@api '
end

Cucumber::Rake::Task.new(:firefox) do |t|
  t.cucumber_opts = 'features -p firefox --format pretty --profile html -t ~@api '
end

Cucumber::Rake::Task.new(:poltergeist) do |t|
  t.cucumber_opts = 'features -p poltergeist --format pretty --profile html -t ~@api '
end

Cucumber::Rake::Task.new(:chrome) do |t|
  t.cucumber_opts = 'features -p chrome --format pretty --profile html'
end

Cucumber::Rake::Task.new(:ie) do |t|
  t.cucumber_opts = 'features -p ie --format pretty --profile html'
end

task :run_tests, [:browser, :tags, :without_tags, :feature, :scenario] do |t, args|

  cucumberStatement = 'cucumber --profile=html DRIVER=' + args[:browser]

  if (!args[:tags].nil? && !args[:tags].empty?)
    splitTags = args[:tags].split ' '
    splitTags.each do |singleTag|
      cucumberStatement += ' --tags @' + singleTag
    end
  elsif (!args[:feature].nil? && !args[:feature].empty?)
    cucumberStatement += ' features/' + args[:scenario] + '"'
  elsif (!args[:scenario].nil? && !args[:scenario].empty?)
    cucumberStatement += ' features --name "' + args[:scenario] + '"'
  end
  if (!args[:without_tags].nil? && !args[:without_tags].empty?)
    splitTags = args[:without_tags].split ' '
    splitTags.each do |singleTag|
      cucumberStatement += ' --tags ~@' + singleTag
    end
  end
  sh(cucumberStatement) do |success, _exit_code|
    @success &= success
  end
end
