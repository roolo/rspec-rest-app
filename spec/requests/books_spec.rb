require 'spec_helper'

describe "Books" do
  describe "GET /books" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get books_path
      response.status.should be(200)
    end
  end
  
  describe "POST /books" do
    it "create a book" do
      book = {name: 'Alchandira', description: 'Something'}
      post books_path, {book: book}
      response.status.should be(302)
      
      new_book = Book.find_by_name book[:name]
      new_book.should_not be_nil
      
      new_book.name.should eq(book[:name])
      new_book.description.should eq(book[:description])
    end
  end
  
  describe "PUT /books/:id" do
    it "updates a book" do
      book = {name: 'Alchandira', description: 'Something'}
      updated_book = {name: 'Cave', description: 'Something'}

      # Create book
      post books_path, book: book
      response.status.should eq(302)
      
      # Verify creation                                
      new_book = Book.find_by_name book[:name]
      new_book.should_not be_nil
      
      # Update book
      put book_path(new_book), book: updated_book
      response.status.should eq(302)
      
      # Verify the change
      new_book_updated = Book.find_by_name updated_book[:name]
      new_book_updated.should_not be_nil
      new_book_updated.id.should eq new_book.id 
      new_book_updated.name.should eq updated_book[:name]
    end
  end
end
