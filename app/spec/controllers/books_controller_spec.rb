require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      book = Book.new(title: "Example Title", author: "Example Author")
      expect(book).to be_valid
    end

    it "is not valid without a title" do
      book = Book.new(author: "Example Author")
      expect(book).not_to be_valid
    end

    it "is not valid without an author" do
      book = Book.new(title: "Example Title")
      expect(book).not_to be_valid
    end
  end
end