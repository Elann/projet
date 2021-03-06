require 'rails_helper'

RSpec.describe "Users", type: :request do

 describe "Une inscription" do

  describe "ratée" do
      it "ne devrait pas créer un nouvel utilisateur" do
       expect{
          visit signup_path
          fill_in "Nom", :with => ""
          fill_in "eMail", :with => ""
          fill_in "Mot de passe", :with => ""
          fill_in "Confirmation mot de passe", :with => ""
          click_button "Inscription"
#          expect(response).to render_template('users/new')
#          expect(response).to have_selector("div#error_explanation")
       }.not_to change{User.count}
      end
    end
    
  describe "réussie" do

      it "devrait créer un nouvel utilisateurr" do
        expect{
          visit signup_path
          fill_in "Nom", :with => "Example User"
          fill_in "eMail", :with => "user@example.com"
          fill_in "Mot de passe", :with => "foobar"
          fill_in "Confirmation mot de passe", :with => "foobar"
          click_button "Inscription"
#          expect(response).to have_selector("div.flash.success", :content => "Bienvenue")
#          expect(response).to render_template('users/show')
        }.to change{User.count}.by(1)
      end
    end
  describe "identification/déconnexion" do

    describe "l'échec" do
      it "ne devrait pas identifier l'utilisateur" do
        visit signin_path
        fill_in "eMail",    :with => ""
        fill_in "Mot de passe", :with => ""
        click_button
        expect(response).to have_selector("div.flash.error", :content => "Invalid")
      end
    end

    describe "le succès" do
      it "devrait identifier un utilisateur puis le déconnecter" do
        user = Factory(:user)
        visit signin_path
        fill_in "eMail",    :with => user.email
        fill_in "Mot de passe", :with => user.password
        click_button
        expect(controller).to be_signed_in
        click_link "Déconnexion"
        expect(controller).not_to be_signed_in
      end
    end
  end
end

