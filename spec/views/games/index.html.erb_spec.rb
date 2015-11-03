require 'rails_helper'

RSpec.describe "games/index", type: :view do
    # userをFactoryGirlで作る
	  let(:user) { FactoryGirl.build(:user) }
  before(:each) do
		user.save
		sign_in user
    assign(:games, [
      user.games.create!(
        :score => 1,
        :turn => 2,
      ),
      user.games.create!(
        :score => 1,
        :turn => 2,
      )
    ])
  end

  it "renders a list of games" do
		allow(user).to receive(:all_games_ended?).and_return(true) 
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
