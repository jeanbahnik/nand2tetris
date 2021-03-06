module Parser

  def Parser.is_comment(line)
    line[0..1] == "//"
  end

  def Parser.has_comment(line)
    line.include?('//')
  end

  def Parser.is_a_command(line)
    line[0] == "@" && line[1] =~ /\d/
  end

  def Parser.is_c_command(line)
    line.include?('=') || line.include?(';')
  end

  def Parser.is_a_variable(line)
    line[0] == "@" && !(line[1] =~ /[[:alpha:]]/).nil?
  end

  def Parser.is_a_label(line)
    line[0] == '('
  end

end
