require_relative 'spec_helper'


describe "MarsRoverApp" do

user_input =
"5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
"

user_output =
"1 3 N
5 1 E
"

  context "Initialization" do
    it "accepts a text file as an argument" do
      argv = "input.txt"
      f = File.open(argv)
      content = f.read
      expect(content).to eq(user_input)
    end
  end

  context "Launch" do
    it "executes the program returns output in file" do
      argv = "input.txt"
      MarsRoverApp.run!(argv)
      o = File.open("output.txt")
      output = o.read
      expect(output).to eq(user_output)
    end
  end
end
