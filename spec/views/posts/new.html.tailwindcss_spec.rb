require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      title: "MyString",
      body: "MyText",
      tag: "",
      status: "MyString",
      is_admin: false
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[body]"

      assert_select "input[name=?]", "post[tag]"

      assert_select "input[name=?]", "post[status]"

      assert_select "input[name=?]", "post[is_admin]"
    end
  end
end
