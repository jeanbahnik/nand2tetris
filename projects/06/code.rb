class Code

  # D=A
  # D=D+A
  # M=D

  DESTINATION = {
    "" => "000",
    "M" => "001",
    "D" => "010",
  }.freeze

  COMPUTE = {
    "D" => "0001100",
    "A" => "0110000",
    "D+A" => "0000010",
    "M" => "1110000"
  }.freeze

  JUMP = {
    "" => "000"
  }.freeze

  attr_accessor :dest, :comp, :jump

  def initialize(line)
    @line = line
  end

  def translate_a_command
    @line[1..-1].to_i.to_s(2).rjust(16, '0')
  end

  def translate_c_command
    break_c_command

    return "111" + COMPUTE[@comp.to_s] + DESTINATION[@dest.to_s] + JUMP[@jmp.to_s]
  end

  def break_c_command
    if @line.include?('=')
      @dest = @line.partition('=').first
      @comp = @line.partition('=').last
    end
    if @line.include?(';')
      @comp = @line.partition(';').first
      @jmp = @line.partition(';').last
    end
  end
end
