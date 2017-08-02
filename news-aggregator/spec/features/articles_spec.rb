require 'spec_helper'

feature "User visits the /articles page" do

  scenario "no articles are available on /articles" do

    visit "/articles"

    expect(page).to have_content("There are no articles available")
  end

end
