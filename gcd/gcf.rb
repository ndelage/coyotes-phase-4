class GCF
  def self.compute(val_1, val_2)
    raise ArgumentError, "Arguments must integers" unless self.valid_arguments?(val_1, val_2)

    (factors(val_1) & factors(val_2)).max
  end

  def self.valid_arguments?(val_1, val_2)
    [val_1, val_2].all?{|v| v.instance_of?(Fixnum)}
  end

  def self.factors(val)
    return [] if val.nil?

    (2..val).select do |f|
      val % f == 0
    end
  end
end
