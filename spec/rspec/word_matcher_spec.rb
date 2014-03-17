require 'spec_helper'

# # # # # # # # # # # # # # # # # # # # # # # # #
# These tests kill two birds with one stone by  #
# testing both WordMatcher and AbstractMatcher  #
# # # # # # # # # # # # # # # # # # # # # # # # #

describe 'WordMatcher' do
  include SourceMatchers::RSpec

  before(:all) do
    @source = parse_source_code('exercises.rb')
  end

  it "matches words" do
    matcher = include_code(:bam!)
    expect(matcher.matches? @source).to eq(true)

    matcher = include_code(:blah)
    expect(matcher.matches? @source).to eq(false)
  end

  it "can namespace modules" do
    matcher = include_code(:secret).for(:Getters)
    expect(matcher.matches? @source).to eq(true)

    matcher = include_code(:secret).for(:Setters)
    expect(matcher.matches? @source).to eq(false)
  end

  it "can namespace classes" do
    matcher = include_code(:bam!).in(:BoxD)
    expect(matcher.matches? @source).to eq(true)

    matcher = include_code(:bam!).in(:BoxC)
    expect(matcher.matches? @source).to eq(false)
  end

  it "can namespace methods" do
    matcher = include_code(:bam!).in_method(:close)
    expect(matcher.matches? @source).to eq(true)

    matcher = include_code(:bam!).in_method(:open)
    expect(matcher.matches? @source).to eq(false)
  end

  it "can namespace class methods" do
    matcher = include_code(:rand).in_class_method(:roll_dice)
    expect(matcher.matches? @source).to eq(true)

    matcher = include_code(:sound).in_class_method(:bop)
    expect(matcher.matches? @source).to eq(true)

    matcher = include_code(:pull).in_class_method(:bop)
    expect(matcher.matches? @source).to eq(false)
  end

  it "can namespace class methods within class names" do
    matcher = include_code(:rand).in_class_method(:MyRandom, :roll_dice)
    expect(matcher.matches? @source).to eq(true)

    matcher = include_code(:rand).in_class_method(:BopIt, :roll_dice)
    expect(matcher.matches? @source).to eq(false)
  end
end
