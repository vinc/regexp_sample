# Add a very limited `Regexp#sample` method.
module RegexpSample
  refine Regexp do
    def sample(n = nil)
      samples = (n || 1).times.map { RegexpSample.generate(self) }
      n.nil? ? samples.first : samples
    end
  end

  def self.generate(regex)
    pattern = classify(regex.inspect[1...-1])

    r = /(\[[^\]]+\]|[^\[])({\d+}|{\d*,\s*\d+}|)/
    pattern.scan(r).map do |cs, qs|
      cs = cs[1...-1] if cs[0] == "["
      set = cs.scan(/(.)(?:-(.))?/).map do |a, b|
        (a..(b || a)).to_a
      end.flatten.uniq

      qs = "{1}" if qs.empty?
      m = qs.match(/{(\d+)?(?:\s*,\s*(\d+))?}/)
      ((m[1] || "1")..(m[2] || m[1] || "1")).to_a.sample.to_i.times.map do
        set.to_a.sample
      end
    end.join
  end

  private

  def self.classify(pattern)
    pattern
      .gsub("\\d", "[0-9]")
      .gsub("\\h", "[0-9a-f]") # FIXME: Add A-F for uppercase
      .gsub("\\w", "[a-zA-Z0-9_]")
  end
end
