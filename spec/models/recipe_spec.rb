require 'spec_helper'

describe Recipe do

  before { @recipe = Recipe.new(name: "Example Recipe", picture: "pic.jpg", description: "A test recipe.", ingredients: "1. a 2. test 3. recipe", instructions: "1. a 2. test 3. recipe") }

  subject { @recipe }

  it { should respond_to(:name) }
  it { should respond_to(:picture) }
  it { should respond_to(:description) }
  it { should respond_to(:ingredients) }
  it { should respond_to(:instructions) }
  it { should be_valid }

  describe "when name is not present" do
    before { @recipe.name = " " }
    it { should_not be_valid }
  end
end
