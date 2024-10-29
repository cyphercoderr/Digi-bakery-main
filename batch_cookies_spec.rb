feature 'Cooking cookies' do
  scenario 'Cooking a batch cookie' do
    user = create_and_signin
    oven = user.ovens.first
    ActiveJob::Base.queue_adapter = :test
  
    visit oven_path(oven)

    expect(page).to_not have_content 'Your Cookies are cooking'
  
    expect {
      click_link_or_button 'Prepare Cookie'
      fill_in 'Fillings', with: 'Chocolate Chip', match: :first
      click_button 'Mix and bake'
    }.to have_enqueued_job(CookieCookingJob).with(oven.batch_cookie)

    expect(current_path).to eq(oven_path(oven))
    expect(page).to have_content 'Your Cookies are cooking'
  end  

  scenario 'Trying to bake a cookie while oven is full' do
    user = create_and_signin
    oven = user.ovens.first

    oven = create(:oven, user: user)
    visit oven_path(oven)

    click_link_or_button 'Prepare Cookie'
    fill_in 'Fillings', with: 'Chocolate Chip'
    click_button 'Mix and bake'

    click_link_or_button  'Prepare Cookie'
    expect(page).to have_content 'A batch is already in the oven!'
    expect(current_path).to eq(oven_path(oven))
    expect(page).to_not have_button 'Mix and bake'
  end
end
