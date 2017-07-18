module Code

  DESTINATION = {
    "" => "000",
    "M" => "001",
    "D" => "010",
  }.freeze

  COMPUTE = {
    # a = 0
    "0" => "0101010",
    "D" => "0001100",
    "A" => "0110000",
    "D+A" => "0000010",
    # a = 1
    "M" => "1110000",
    "D-M" => "1010011"
  }.freeze

  JUMP = {
    "" => "000",
    "JGT" => "001",
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
