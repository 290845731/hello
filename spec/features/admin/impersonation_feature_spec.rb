require 'spec_helper'

describe "admin" do


  # As an admin
  # I can click "impersonate" on a user's profile
  # So I can impersonate that user
  it "impersonation" do
    given_I_have_a_password_credential
    given_I_have_an_admin_password_credential
    when_sign_in_with_admin_data
    then_I_should_be_logged_in_as_an_admin


    user = User.first
    #
    # IMPERSONATES
    #
    visit user_path(user)
    click_button 'Impersonate'
    expect_flash_notice "You are now #{user.name}"
    then_I_should_be_logged_in_as_a_user(2)

    #
    # BACK TO SELF
    #
    click_link 'Back to Myself'
    expect_flash_notice "You are yourself again"
    then_I_should_be_logged_in_as_an_admin
  end


end