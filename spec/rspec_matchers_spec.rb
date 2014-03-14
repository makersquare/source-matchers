require 'spec_helper'

describe SourceMatchers::RSpec do

  before(:all) do
    @source = parse_source_code('exercises.rb')
  end

  it "matches atoms"
  it "can namespace modules"
  it "can namespace classes"
  it "can namespace methods"
end
