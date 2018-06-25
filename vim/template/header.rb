#!/usr/bin/env bash
exec /arm/tools/setup/bin/mrun +ruby/ruby/2.5.1 ruby $0 $@
#!/usr/bin/env ruby

require 'optparse'
require 'pathname'

$here = File.dirname(File.expand_path($0))

at_exit {
	puts 'done'
}

if __FILE__ == $0
	options = Hash.new
	parser = OptionParser.new "Usage: #{$0} [options] [FILE]" do |opts|
		opts.on '-h', '--help', 'Show this message' do
			puts opts
			exit
		end
		opts.on('-v', '--[no-]verbose', 'Run verbosely') do |v|
			options[:verbose] = v
		end
	end

	begin
		parser.parse!
	rescue OptionParser::InvalidOption => e
		puts e
		puts parser
		exit
	end

	p options
	puts "ARGV: #{ARGV.join(' ')}"
end

