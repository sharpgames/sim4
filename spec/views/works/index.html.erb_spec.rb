require 'rails_helper'

RSpec.describe "works/index", type: :view do
  before(:each) do
    assign(:works, Kaminari.paginate_array([
      Work.create!(
        :name => "Name",
        :desc => "MyText",
        :url => "MyUrl"
      ),
      Work.create!(
        :name => "Name",
        :desc => "MyText",
        :url => "MyUrl"
      )
    ]).page(1))
  end

  it "renders a list of works" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyUrl".to_s, :count => 2
  end
end
