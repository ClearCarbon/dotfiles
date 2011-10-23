require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install, :mode do |task, args|
  args.with_defaults(:mode => 'normal')
  mode = args[:mode]
  quiet = replace_all = mode=='quiet'

  Dir['*'].each do |file|
    next if %w[Rakefile README.markdown LICENSE Gemfile Gemfile.lock temp tmx].include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file,quiet)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file,quiet)
        when 'y'
          replace_file(file,quiet)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file,quiet)
    end
  end
end

def replace_file(file,quiet)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file,quiet)
end

def link_file(file,quiet)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write (quiet ? File.read(file) : ERB.new(File.read(file)).result(binding))
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
