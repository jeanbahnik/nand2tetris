file = ARGV[0]
import_file = File.open("#{file}/#{file}.asm")
export_file = File.new("#{file}.hack", "w")

import_file.each_line do |line|

end
