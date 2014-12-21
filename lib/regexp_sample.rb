# Add a very limited `Regexp#sample` method.
module RegexpSample
  def self.generate(regex)
    r = /(\[[^\]]+\]|[^\[])({\d+}|{\d*,\s*\d+}|)/
    regex.inspect[1...-1].scan(r).map do |cs, qs|
      cs = cs[1...-1] if cs[0] == "["
      set = cs.scan(/(.)(?:-(.))?/).map do |a, b|
        (a..(b || a)).to_a
      end.flatten.compact

      qs = "{1}" if qs.empty?
      m = qs.match(/{(\d+)?(?:\s*,\s*(\d+))?}/)
      ((m[1] || "1")..(m[2] || m[1] || "1")).to_a.sample.to_i.times.map do
        set.to_a.sample
      end
    end.join
  end

  refine Regexp do
    def sample(n = nil)
      samples = (n || 1).times.map { RegexpSample.generate(self) }
      n.nil? ? samples.first : samples
    end
  end
end
