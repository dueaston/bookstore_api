require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      author = Author.create(name: "John Doe", email: "john@example.com", bio: "Lorem ipsum")
      get :show, params: { id: author.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new author" do
        expect {
          post :create, params: { author: { name: "Jane Doe", email: "jane@example.com", bio: "Lorem ipsum" } }
        }.to change(Author, :count).by(1)
      end

      it "redirects to the created author" do
        post :create, params: { author: { name: "Jane Doe", email: "jane@example.com", bio: "Lorem ipsum" } }
        expect(response).to redirect_to(Author.last)
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      author = Author.create(name: "John Doe", email: "john@example.com", bio: "Lorem ipsum")
      get :edit, params: { id: author.to_param }
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "Updated Name" }
      }

      it "updates the requested author" do
        author = Author.create(name: "John Doe", email: "john@example.com", bio: "Lorem ipsum")
        put :update, params: { id: author.to_param, author: new_attributes }
        author.reload
        expect(author.name).to eq("Updated Name")
      end

      it "redirects to the author" do
        author = Author.create(name: "John Doe", email: "john@example.com", bio: "Lorem ipsum")
        put :update, params: { id: author.to_param, author: new_attributes }
        expect(response).to redirect_to(author)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested author" do
      author = Author.create(name: "John Doe", email: "john@example.com", bio: "Lorem ipsum")
      expect {
        delete :destroy, params: { id: author.to_param }
      }.to change(Author, :count).by(-1)
    end

    it "redirects to the authors list" do
      author = Author.create(name: "John Doe", email: "john@example.com", bio: "Lorem ipsum")
      delete :destroy, params: { id: author.to_param }
      expect(response).to redirect_to(authors_url)
    end
  end
end