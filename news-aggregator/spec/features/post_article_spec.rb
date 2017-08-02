require 'spec_helper'

feature "submit an article" do

  before :each do
    CSV.open("articles.csv", "ab") do |csv|
      csv << ["Google","Google's Homepage","https://www.google.com/"]
    end
  end

  after :each do
    CSV.open("articles.csv", "wb") do |csv|
      csv << ["name","description","url"]
    end
  end

  scenario "user submits a valid article" do
    visit "/articles/new"
    fill_in "article_name", with: "CSS"
    fill_in "article_description", with: "Basic CSS docs"
    fill_in "article_url", with: "https://www.w3schools.com/css/css_text.asp"
    click_button "Submit"

    visit "/articles"

    expect(page).to have_content("CSS")
    expect(page).to have_content("Basic CSS docs")
    expect(page).to have_content("https://www.w3schools.com/css/css_text.asp")
  end

  scenario "user submits an invalid article" do
    visit "/articles/new"

    click_button "Submit"

    expect(page).to have_content("Please provide an article name")
    fill_in "article_name", with: "CSS"
    click_button "Submit"

    expect(page).to have_content("Please provide a description")
    fill_in "article_description", with: "Basic CSS docs"
    click_button "Submit"
    
    expect(page).to have_content("Please provide a valid URL")
  end

end
