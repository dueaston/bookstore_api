require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do

    it "is valid with valid attributes" do
      author = Author.create(name: "Example Author", email: "author@example.com")
      book = Book.new(title: "Example Title", author: author)
      expect(book).to be_valid
    end

    it "is not valid without a title" do
      author = Author.create(name: "Example Author", :email "author@example.com")
      book = Book.new(title: nil, author: author)
      expect(book).not_to be_valid
    end

    it "is not valid without an author" do
      book = Book.new(title: "Example Title")
      expect(book).not_to be_valid
    end
  end
end