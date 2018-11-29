#!/usr/bin/env ruby

input = ARGV.first
raise "Usage: #{$0} <number>" unless input

# Check if binary
if input[/^0b[01]+$/] then
	bases = [2]
# Check if hex
elsif input[/[a-fA-F]/] || input[/^0?x/] then
	bases = [16]
# Check if not binary
elsif input[/[2-9]/] then
	bases = [10, 16]
# Assume it's hex, bin, or dec
else
	bases = [10, 16, 2]
end

def num2all(int)
	puts "Bin: #{int.to_s(2)}"
	puts "Dec: #{int.to_s(10)}"
	puts "Hex: #{int.to_s(16)}"
end

prefix = { 10 => '', 16 => "'h", 2 => "'b" }

bases.each do |base|
	puts "==> #{prefix[base]}#{input} <=="
	num2all(input.to_i(base))
end

