class Parser

  def initialize(line)
    @line = line
  end

  def is_comment
    @line[0..1] == "//"
  end

  def is_a_command
    @line[0] == "@" && @line[1] =~ /\d/
  end

  def is_c_command
    @line.include?('=') || @line.include?(';')
  end
end
