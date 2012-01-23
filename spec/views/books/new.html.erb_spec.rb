require 'spec_helper'

describe "books/new.html.erb" do
  before(:each) do
    assign(:book, stub_model(Book,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => books_path, :method => "post" do
      assert_select "input#book_name", :name => "book[name]"
      assert_select "textarea#book_description", :name => "book[description]"
    end
  end
end
