require "regexp_sample"

using RegexpSample

describe Regexp, "#sample" do
  it "returns a sample of the regular expression" do
    [
      /aaa/,
      /a{6}/,
      /a{6,12}/,
      /a{,42}/,
      /[0-9]{8}/,
      /\d{8}/,
      /[a-zA-Z0-9_]{8}/,
      /\w{8}/,
      /[0-9a-h]{8}-[0-9a-h]{4}-[0-9a-h]{4}-[0-9a-h]{4}-[0-9a-h]{12}/,
      /\h{8}-\h{4}-\h{4}-\h{4}-\h{12}/
    ].each { |regexp| expect(regexp.sample).to match(regexp) }
  end

  it "returns n samples of the regular expression" do
    regexp = /a{6}/
    expect(regexp.sample(1)).to be_an(Array)
    expect(regexp.sample(1).first).to match(regexp)
    expect(regexp.sample(1).size).to eq(1)
    expect(regexp.sample(3).size).to eq(3)
  end
end
