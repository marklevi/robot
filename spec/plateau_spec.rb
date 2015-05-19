require_relative 'spec_helper'

describe Plateau do

  subject(:plateau) { Plateau.new "2 2" }
  let(:position) { Position.new "#{@x} 2 N" }

  describe ".initialization" do
    its(:max_north) { should eql 2 }
    its(:max_east) { should eql 2 }
    its(:max_south) { should eql 0 }
    its(:max_west) { should eql 0 }
  end

  context "when position is within bounds" do

    it "will return true" do
      @x = 2
      expect(subject.within_border?(position)).to be_true
    end

  end

  context "when position is out of bounds" do

    let(:position) { Position.new '3 3 N' }

    it "will return false" do
      @x = 3
      expect(subject.within_border?(position)).to be_false
    end

  end

end