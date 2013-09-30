require 'spec_helper'

describe Prize do

  it {should belong_to(:category)}
  it {should have_many(:prize_elements).dependent(:destroy)}

  it "displays name" do
    p = Prize.create
    p.prize_elements.build(value: 100, name: 'abc')
    p.prize_elements.build(value: 50, name: 'def')
    p.save
    expect(p.name).to eq("$100 - abc\n$50 - def")
  end
end