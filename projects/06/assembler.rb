require_relative 'parser'
require_relative 'code'

folder = ARGV[0]
file = ARGV[1]
import_file = File.open("#{folder}/#{file}.asm")
export_file = File.new("#{file}.hack", "w")

import_file.each_line do |line|
  line = line.chomp!
  line_p = Parser.new(line)
  next if line_p.is_comment || line.empty?
  line_c = Code.new(line)
  if line_p.is_a_command
    line = line_c.translate_a_command
  end
  if line_p.is_c_command
    line = line_c.translate_c_command
  end
  puts line
  export_file << line + "\n"
end
