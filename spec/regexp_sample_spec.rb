require "regexp_sample"

using RegexpSample

describe Regexp, "#sample" do
  it "returns a sample for the regular expression" do
    regexp = /aaa/
    expect(regexp.sample).to match(regexp)

    regexp = /a{6}/
    expect(regexp.sample).to match(regexp)

    regexp = /a{6,12}/
    expect(regexp.sample).to match(regexp)

    regexp = /a{,42}/
    expect(regexp.sample).to match(regexp)

    regexp = /[a-zA-Z0-9]{8}/
    expect(regexp.sample).to match(regexp)

    regexp = /[0-9a-h]{8}-[0-9a-h]{4}-[0-9a-h]{4}-[0-9a-h]{4}-[0-9a-h]{12}/
    expect(regexp.sample).to match(regexp)
  end
end
