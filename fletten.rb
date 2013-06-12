    Flet = proc do |list|
      result = []
      case list
      when Array then
        list.map { |item| result += Flet.call item }
      when Fixnum
        result <<= list
      end
      result
    end
