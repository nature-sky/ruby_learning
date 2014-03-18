class Token

  attr_reader :token

  def initialize(token)
    @token = token
  end
end
class Num < Token

  def initialize(num)
    @num = num
  end

  def token
    @num
  end
end
class Scanner

  def initialize(code)
    @code = code
    @i = -1
  end
  
  def scan
    ignore_spaces
    case lookahead
    when /\d/
      Num.new number
    when /\+|\-|\*|\/|\(|\)/
      token = Token.new lookahead
      step
      token
    when nil
    else
      raise 'scan error'
    end
  end
  
  def ignore_spaces
    step while lookahead =~ /\s/
  end
  
  def number
    num = 0
    begin
      num += lookahead.to_i
      step
    end while lookahead =~ /\d/
    num
  end
  
  def lookahead
    @code[@i + 1]
  end
  
  def step
    @i += 1
  end
end
class Expr

  def initialize(operator, a, b)
    @operator = operator
    @a, @b = a, b
  end

  def right=(expr)
    @b = expr
  end

  def inspect
    "(#{@a.inspect} #{@operator} #{@b.inspect})"
  end
end
class Number < Expr

  def initialize(num)
    @num = num.token
  end

  def inspect
    @num.to_s
  end
end

# Grammer
# A -> CB
# B -> '+' CB | '-' CB | 庰
# C -> ND
# D -> '*' ND | '/' ND | 庰
# N -> '(' A ')' | Num
class Parser

  attr_reader :token

  def initialize(code)
    @scanner = Scanner.new code
  end

  def scan
    @token = @scanner.scan
  end

  def store(token)
    @tokens ||= []
    token = token.token if token.is_a? Token
    @tokens << token
  end

  def pop
    @tokens.pop
  end

  def parse
    scan
    parse_A
    pop
  end

  def parse_A
    case
    when (token.is_a? Num or
          token.token == '(')
      parse_C
      parse_B
    else
      parse_error
    end
  end

  def parse_B
    case
    when (token.nil? or
          token.token == ')')
    when (token.token == '+' or
          token.token == '-')
      op = token.token
      scan
      parse_C
      b, a = pop, pop
      store Expr.new op, a, b
      parse_B
    else
      parse_error
    end
  end

  def parse_C
    case
    when (token.is_a? Num or
          token.token == '(')
      parse_N
      parse_D
    else
      parse_error
    end
  end

  def parse_D
    case
    when (token.nil? or
          token.token == '-' or
          token.token == '+' or
          token.token == ')')
    when (token.token == '*' or
          token.token == '/')
      op = token.token
      scan
      parse_N
      b, a = pop, pop
      store Expr.new op, a, b
      parse_D
    else
      parse_error
    end
  end

  def parse_N
    case
    when (token.is_a? Num)
      store Number.new token
      scan
    when token.token == '('
      scan
      parse_A
      parse_error if not token.token == ')'
      scan
    else
      parse_error
    end
  end

  def parse_error
    raise 'parse error'
  end
end
eg1 = '1 / 2 / 3 - 4 / 5 / 6'
eg2 = '1 - (2 - 3)'
eg3 = '1 / 2 / 3'
parser = Parser.new eg1
expr = parser.parse
puts expr.inspect
