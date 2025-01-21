require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:post) {
    Post.create!(
      title: "MyString",
      body: "MyText",
      tag: "",
      status: "MyString",
      is_admin: false
    )
  }

  before(:each) do
    assign(:post, post)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[body]"

      assert_select "input[name=?]", "post[tag]"

      assert_select "input[name=?]", "post[status]"

      assert_select "input[name=?]", "post[is_admin]"
    end
  end
end
