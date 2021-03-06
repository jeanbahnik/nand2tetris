module Code

  DESTINATION = {
    "" => "000",
    "M" => "001",
    "D" => "010",
    "MD" => "011",
    "A" => "100",
    "AM" => "101",
    "AD" => "110",
    "AMD" => "111",
  }.freeze

  COMPUTE = {
    # a = 0
    "0" => "0101010",
    "1" => "0111111",
    "-1" => "0111010",
    "D" => "0001100",
    "A" => "0110000",
    "D+1" => "0011111",
    "A+1" => "0110111",
    "D-1" => "0001110",
    "A-1" => "0110010",
    "D+A" => "0000010",
    # a = 1
    "M" => "1110000",
    "!M" => "1110001",
    "-M" => "1110011",
    "M+1" => "1110111",
    "M-1" => "1110010",
    "D+M" => "1000010",
    "D-M" => "1010011",
    "M-D" => "1000111",
    "D&M" => "1000000",
    "D|M" => "1010101"
  }.freeze

  JUMP = {
    "" => "000",
    "JGT" => "001",
    "JEQ" => "010",
    "JGE" => "011",
    "JLT" => "100",
    "JNE" => "101",
    "JLE" => "110",
    "JMP" => "111"
  }.freeze

  def Code.translate_a_command(line)
    line[1..-1].to_i.to_s(2).rjust(16, '0')
  end

  def Code.translate_c_command(line)
    dest = line.include?('=') ? Code.get_dest(line) : ""
    comp = Code.get_comp(line)
    jmp = line.include?(';') ? Code.get_jmp(line) : ""

    p "Missing COMPUTE: #{comp}" if COMPUTE[comp.to_s].nil?
    p "Missing DESTINATION: #{dest}" if DESTINATION[dest.to_s].nil?
    p "Missing JUMP: #{jmp}" if JUMP[jmp.to_s].nil?

    "111" + COMPUTE[comp.to_s] + DESTINATION[dest.to_s] + JUMP[jmp.to_s]
  end

  def Code.get_dest(line)
    line.partition('=').first
  end

  def Code.get_comp(line)
    if line.include?('=')
      line.partition('=').last
    else
      line.partition(';').first
    end
  end

  def Code.get_jmp(line)
    line.partition(';').last
  end
end
