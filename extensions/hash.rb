class Hash
  def method_missing(method, *args)
    if method.to_s.split("").last == "="
      self[method.to_s.gsub("=", "").to_sym] = args.first
    else
      if (self.keys|[method.to_s,method]).length != 0
        return self.values_at(method, method.to_s).compact.first
      else
        return nil
      end
    end
  end
end