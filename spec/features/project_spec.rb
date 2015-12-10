require 'rails_helper'

feature 'Project' do
  let(:user_page) { UserPage.new }
  let(:user) { create(:user) }
  let(:project) { Project.last }
  let(:project_2) { attributes_for(:project) }

  before do
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
  end

  scenario 'Create, update, delete', js: true do
    user_page.open(user)
    expect(page).to have_content('Projects')
    find(:link, 'Projects').click()
    expect(page).to have_content('Current Projects')
    find(:xpath, "//a[@href='/users/#{user.id}/projects/new']").click()
    expect(page).to have_content('Project')
    user_page.create_project('')
    expect(page).to have_content('Title should be exist')
    user_page.create_project('SuperProject')
    expect(page).to have_content('SuperProject')
    find(:xpath, "//a[@href='/users/#{user.id}/projects/new']").click()
    expect(page).to have_content('Project')
    user_page.create_project('SuperProject')
    expect(page).to have_content('This Project already exist')
    user_page.create_project(project_2[:title])
    expect(page).to have_content(project_2[:title])
    within("#project_#{project.id}") do
      find(:xpath, "//a[@href='/users/#{user.id}/projects/#{project.id}/edit']").click()
    end
    expect(page).to have_content('Project')
    user_page.create_project('JustProject')
    expect(page).to have_content('JustProject')
    within("#project_#{project.id}") do
      find("a[data-method='delete']").click()
    end
    expect(page).to_not have_content('JustProject')
  end
end
