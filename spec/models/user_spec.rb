require "spec_helper"
#require "user"

describe User do

  before { @user = User.new(username: "Example User", name: "user", password: "test", password_confirmation: "test") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:name) }

  it { should be_valid }

  describe "when username is not present" do

    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = " " }
    it { should_not be_valid }
  end
  
  describe "when password confirm is not present" do
    before { @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when username is too long" do
    before { @user.username = "a" * 26 }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = "a" }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = "a" * 2 }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = "a" * 3 }
    it { should_not be_valid }
  end
end
