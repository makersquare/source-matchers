require 'spec_helper'

describe 'MethodMatcher' do
  include SourceMatchers::RSpec

  before(:all) do
    @source = parse_source_code('exercises.rb')
  end

  it "matches methods" do
    matcher = include_method(:close)
    expect(matcher.matches? @source).to eq(true)

    matcher = include_method(:i_dont_exist)
    expect(matcher.matches? @source).to eq(false)
  end

  it "matches methods in methods" do
    matcher = include_method(:why_am_i_here).in_method(:stand_up)
    expect(matcher.matches? @source).to eq(true)

    matcher = include_method(:i_dont_exist).in_method(:stand_up)
    expect(matcher.matches? @source).to eq(false)
  end
end
