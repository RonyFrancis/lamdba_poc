require 'rails_helper'

RSpec.describe LamdbaController, type: :controller do
  describe 'GET #new' do
    subject { get :new }
    it 'renders new template' do
      expect(subject).to render_template(:new)
    end
    it 'does not renders other template' do
      expect(subject).not_to render_template(:index)
    end
    it 'should have 200 status' do
      expect(subject).to have_http_status(200)
    end
    it 'should not have 500 status' do
      expect(subject).not_to have_http_status(500)
    end
  end

  describe 'POST #create' do
    subject { post :create, params:{ lamdba: { key: 1 }} }
    it 'should have redirect status' do
      expect(subject).to have_http_status(:redirect)
    end
    it 'should not have 500 status' do
      expect(subject).not_to have_http_status(500)
    end
    it 'redirect_to show' do
      expect(subject).to redirect_to("/lambda/#{assigns(:params).id}")
    end
  end
end
