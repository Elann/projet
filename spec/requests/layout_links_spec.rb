require 'spec_helper'
require 'rails_helper'


describe "LayoutLinks" do

  it "devrait trouver une page Accueil à '/'" do
    get '/'
    expect(response.body).to have_title("Accueil")
  end

  it "devrait trouver une page Contact at '/contact'" do
    get '/contact'
    expect(response.body).to have_title("Contact")
  end

  it "should have an À Propos page at '/about'" do
    get '/about'
    expect(response.body).to have_title("À Propos")
  end

  it "devrait trouver une page Aide à '/help'" do
    get '/help'
    expect(response.body).to have_title("Aide")
  end
  
  it "devrait avoir une page d'inscription à '/signup'" do
    get '/signup'
    expect(response.body).to have_title("Inscription")
  end
  
 it "devrait avoir le bon lien sur le layout" do
    visit root_path
    click_link "À Propos"
    expect(response).to have_title("À Propos")
    click_link "Aide"
    expect(response).to have_title("Aide")
    click_link "Contact"
    expect(response).to have_title("Contact")
    click_link "Accueil"
    expect(response).to have_title("Accueil")
    click_link "S'inscrire !"
    expect(response).to have_title("S'inscrire !")
end

  describe "quand pas identifié" do
    it "doit avoir un lien de connexion" do
      visit root_path
      expect(response).to have_selector("a", :href => signin_path,
                                         :content => "S'identifier")
    end
  end

  describe "quand identifié" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in "Mot de passe", :with => @user.password
      click_button
    end

    it "devrait avoir un lien de déconnxion" do
      visit root_path
      expect(response).to have_selector("a", :href => signout_path,
                                         :content => "Déconnexion")
    end

    it "devrait avoir un lien vers le profil" 
  end
    it "devrait avoir un lien vers le profil" do
      visit root_path
      expect(response).to have_selector("a", :href => user_path(@user),
                                         :content => "Profil")
    end
  end
end
