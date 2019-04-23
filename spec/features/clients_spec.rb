require 'rails_helper'

RSpec.feature "Clients", type: :feature, js: true do
  scenario "Client uploads their PDF" do
    visit "/upload"

    # pick a file
    expect(page).to have_text "Upload your filled out PDF application"
    page.attach_file("client[document]", Rails.root.join("spec", "fixtures", "application.pdf"), make_visible: true)
    expect(page).to have_text "application.pdf"
  end

  scenario "Client enters their phone and email" do
    visit "/upload"

    check "Text message"
    fill_in "Phone number", with: "1234567890"

    check "Email"
    fill_in "Email", with: "email@example.com"
  end
end
