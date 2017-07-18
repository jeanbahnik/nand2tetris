require_relative 'parser'
require_relative 'code'
require_relative 'symbol_table'

class Main
  def self.perform(folder, file)
    symbol_table = SymbolTable.new
    at_line = -1

    import_file = File.open("#{folder}/#{file}.asm")
    import_file.each_line do |line|
      line = line.chomp.strip
      next if Parser.is_comment(line) || line.empty?
      at_line += 1
      next unless Parser.is_a_label(line)
      line = line.gsub(/\/\/.*/, '').strip if Parser.has_comment(line)
      symbol_table.add_to_table(line, at_line)
      at_line -= 1
    end

    import_file = File.open("#{folder}/#{file}.asm")
    import_file.each_line do |line|
      line = line.chomp.strip
      next unless Parser.is_a_variable(line)
      line = line.gsub(/\/\/.*/, '').strip if Parser.has_comment(line)
      symbol_table.add_to_table(line, at_line)
    end

    import_file = File.open("#{folder}/#{file}.asm")
    export_file = File.new("#{file}.hack", "w")
    import_file.each_line do |line|
      line = line.chomp.strip
      next if Parser.is_comment(line) || line.empty? || Parser.is_a_label(line)
      line = line.gsub(/\/\/.*/, '').strip if Parser.has_comment(line)

      if Parser.is_a_command(line)
        line = Code.translate_a_command(line)
      elsif Parser.is_c_command(line)
        line = Code.translate_c_command(line)
      elsif Parser.is_a_variable(line)
        line = symbol_table.retrieve_from_table(line)
      end

      puts line
      export_file << line + "\n"
    end
  end
end

folder = ARGV[0]
file = ARGV[1]
Main.perform(folder, file)
