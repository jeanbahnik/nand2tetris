class Parser

  def initialize(line)
    @line = line
  end

  def is_comment
    @line[0..1] == "//"
  end
end

# Code

# Symbol Table

file = ARGV[0]
import_file = File.open("#{file}/#{file}.asm")
export_file = File.new("#{file}.hack", "w")

import_file.each_line do |line|
  line_p = Parser.new(line.chomp!)
  next if line_p.is_comment || line.empty?
  puts line
end
