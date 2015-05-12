require 'rails_helper'
require 'spec_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  before(:each) do
	@base_title = "Simple App du Tutoriel Ruby on Rails"
  end

  describe "GET #home" do
    it "devrait réussir" do
      get :home
      expect(response).to be_success
    end
    
 it "devrait avoir le bon titre" do
      get :home
      expect(response.body).to have_title("Simple App du Tutoriel Ruby on Rails | Accueil")
    end
  end

  describe "GET #contact" do
    it "devrait réussir" do
      get :contact
      expect(response).to be_success
    end
    
 it "devrait avoir le bon titre" do
      get :contact
      expect(response.body).to have_title(@base_title + " | Contact")
    end
  end

  describe "GET #about" do
    it "devrait réussir" do
      get :about
      expect(response).to be_success
    end
    
 it "devrait avoir le bon titre" do
      get :about
      expect(response.body).to have_title(@base_title + " | À Propos")
    end
  end
  
  describe "GET #help" do
    it "devrait réussir" do
      get :help
      expect(response).to be_success
    end
    
 it "devrait avoir le bon titre" do
      get :help
      expect(response.body).to have_title(@base_title + " | Aide")
    end
  end
end
