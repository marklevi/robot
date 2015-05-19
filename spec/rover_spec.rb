require_relative 'spec_helper'
require 'debugger'

describe Rover do

  subject(:rover) { Rover.new(position, plateau)}
  let(:plateau) { Plateau.new '2 2' }
  let(:position) { Position.new '1 1 N' }


  describe ".initialization" do
    its(:report) { should eq('1 1 N')}
  end

  context "Execute Commands" do

    it "properly moves in response to valid commands" do
      subject.navigate "MRML"
      expect(subject.report).to eq('2 2 N')
    end

    it "raises error in response to invalid commands" do
      expect{subject.navigate "MRDM"}.to raise_error
    end

  end
end
