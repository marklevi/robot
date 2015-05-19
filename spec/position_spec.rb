require_relative 'spec_helper'

describe Position do

  subject(:position) { Position.new(rover_position) }
  let(:rover_position) { "1 1 #{orientation}" }

  context "when facing north" do

    let(:orientation) { "N" }
    # its(:north?) { should be_true }
    # its(:east?) { should be_false }
    # its(:south?) { should be_false }
    # its(:west?) { should be_false }

    it "can increment y coor by 1" do
      position.move
      expect(position.y).to eq(2)
    end

    it "can turn right" do
      position.turn_right
      expect(position.orientation).to eq("E")
    end

    it "can turn left" do
      position.turn_left
      expect(position.orientation).to eq("W")
    end

  end

  context "when facing east" do

    let(:orientation) { "E" }
    # its(:north?) { should be_false }
    # its(:east?) { should be_true}
    # its(:south?) { should be_false }
    # its(:west?) { should be_false }

    it "can increment x coor by 1" do
      position.move
      expect(position.x).to eq(2)
    end

    it "can turn right" do
      position.turn_right
      expect(position.orientation).to eq("S")
    end

    it "can turn left" do
      position.turn_left
      expect(position.orientation).to eq("N")
    end

  end

  context "when facing south" do

    let(:orientation) { "S" }
    # its(:north?) { should be_false }
    # its(:east?) { should be_false}
    # its(:south?) { should be_true }
    # its(:west?) { should be_false }

    it "can decrement y coor by 1 " do
      position.move
      expect(position.y).to eq(0)
    end

    it "can turn right" do
      position.turn_right
      expect(position.orientation).to eq("W")
    end

    it "can turn left" do
      position.turn_left
      expect(position.orientation).to eq("E")
    end

  end

  context "when facing west" do

    let(:orientation) { "W" }
    # its(:north?) { should be_false }
    # its(:east?) { should be_false}
    # its(:south?) { should be_false }
    # its(:west?) { should be_true }

    it "can decrement x coor by 1" do
      position.move
      expect(position.x).to eq(0)
    end

    it "can turn right" do
      position.turn_right
      expect(position.orientation).to eq("N")
    end

    it "can turn left" do
      position.turn_left
      expect(position.orientation).to eq("S")
    end

  end

end