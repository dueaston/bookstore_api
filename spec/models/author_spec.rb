require 'rails_helper'

RSpec.describe Author, type: :model do

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
      author = Author.new(name: "John Doe", email: "anotherjohn@example.com")
      "Expected {author}. with name: 'John Doe' and email: 'anotherjohn@example.com' to be invalid"
    end
  end
end