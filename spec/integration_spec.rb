require("capybara/rspec")
require("./app")
require("pry")
require("spec_helper")

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe "the survey delete path", {:type => :feature} do
  it "allows the survey designer to delete a survey" do
    test_survey = Survey.create({:title => "Monkey Business", :id => nil})
    id = test_survey.id
    visit "/surveys/#{id}"
    click_button "Delete Survey"
    visit "/"
    expect(page).not_to have_content("Monkey Business")
  end
end
