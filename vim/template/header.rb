#!/usr/bin/env ruby

require 'optparse'

$here = File.dirname(__FILE__)

if __FILE__ == $0
	options = Hash.new
	parser = OptionParser.new "Usage: #{$0} [options] [FILE]" do |opts|
		opts.on '-h', '--help', 'Show this message' do
			puts opts
			exit
		end
		opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
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

