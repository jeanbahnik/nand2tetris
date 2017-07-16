file = ARGV[0]
exportFile = File.new("#{file}.hack", "w")
importFile = File.open("#{file}/#{file}.asm")

importFile.each_line do |line|
    
end
