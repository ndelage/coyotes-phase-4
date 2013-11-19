class GCF
  def self.compute(*values)
    raise ArgumentError, "Arguments must integers" unless self.valid_arguments?(values)

    all_factors = values.map do |v|
      factors(v)
    end

    all_factors.inject(:&).max
  end

  def self.valid_arguments?(arguments)
    arguments.length > 1 && arguments.all?{|v| v.is_a?(Fixnum)}
  end

  def self.factors(val)
    return [] if val.nil?

    (2..val).select do |f|
      val % f == 0
    end
  end
end
