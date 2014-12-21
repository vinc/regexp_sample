require "regexp_sample"

using RegexpSample

describe Regexp, "#sample" do
  it "returns a sample of the regular expression" do
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

  it "returns n samples of the regular expression" do
    regexp = /a{6}/
    expect(regexp.sample(1)).to be_an(Array)
    expect(regexp.sample(1).first).to match(regexp)
    expect(regexp.sample(1).size).to eq(1)
    expect(regexp.sample(3).size).to eq(3)
  end
end
