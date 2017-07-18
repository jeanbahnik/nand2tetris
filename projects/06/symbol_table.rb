class SymbolTable
  def initialize
    @symbols_and_variables = {
      "R0" => "0",
      "R1" => "1",
      "R2" => "2",
      "R3" => "3",
      "R4" => "4",
      "R5" => "5",
      "R6" => "6",
      "R7" => "7",
      "R8" => "8",
      "R9" => "9",
      "R10" => "10",
      "R11" => "11",
      "R12" => "12",
      "R13" => "13",
      "R14" => "14",
      "R15" => "15",
      "SCREEN" => "16384",
      "KBD" => "24576",
      "SP" => "0",
      "LCL" => "1",
      "ARG" => "2",
      "THIS" => "3",
      "THAT" => "4"
    }
    @table_address = 16
  end

  def add_to_table(key, at_line)
    if Parser.is_a_label(key)
      return if @symbols_and_variables.has_key?(key[1...-1])
      @symbols_and_variables[key[1...-1]] = at_line
    else
      return if @symbols_and_variables.has_key?(key[1..-1])
      @symbols_and_variables[key[1..-1]] = get_next_table_address
    end
  end

  def retrieve_from_table(key)
    @symbols_and_variables[key[1..-1]].to_i.to_s(2).rjust(16, '0')
  end

  def get_next_table_address
    while @symbols_and_variables.value?(@table_address.to_s) do
      @table_address += 1
    end
    @table_address
  end

end
