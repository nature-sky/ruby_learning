def public(arg)
end
def klass(arg)
  :public
end
def Main(&block)
  @lala = Class.new
  @lala.class_eval &block
end
def static(arg)
  :main
end
def void(arg)
end
def main(args, &block)
  define_method :main, &block
end
def String(arg)
end
def []
end
def args
end

public klass Main {
  public static void main(String args) {
    System.out.print("hello world");
  }
}

la = @lala.new
la.instance_eval do
  yo = Class.new do
    def out
      la2 = Class.new do
        def print(s)
          Kernel.print s
        end
      end
      la2.new
    end
  end
  System = yo.new
end
la.main
