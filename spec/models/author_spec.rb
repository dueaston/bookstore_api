require 'rails_helper'

RSpec.describe Author, type: :model do
end
  describe "validations" do

    it "is valid with valid attributes" do
      author = Author.new(name: "John Doe", email: "john@example.com")
      expect(author).to be_valid
    end

    it "is not valid without a name" do
      author = Author.new(email: "john@example.com")
      expect(author).not_to be_valid
    end

    it "is not valid without an email" do
      author = Author.new(name: "John Doe")
      expect(author).not_to be_valid
    end

    it "is not valid with a duplicate email" do
      Author.create(name: "John Doe", email: "john@example.com")
      author = Author.new(name: "John Doe", :email => "john@example.com")
      expect(author).not_to be_valid
    end
  end