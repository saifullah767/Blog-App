require 'rails_helper'

RSpec.describe 'Logins', type: :request do
  # Login. As you add validations to Login, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Login.create! valid_attributes
      get logins_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      login = Login.create! valid_attributes
      get login_url(login)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_login_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      login = Login.create! valid_attributes
      get edit_login_url(login)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Login' do
        expect do
          post logins_url, params: { login: valid_attributes }
        end.to change(Login, :count).by(1)
      end

      it 'redirects to the created login' do
        post logins_url, params: { login: valid_attributes }
        expect(response).to redirect_to(login_url(Login.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Login' do
        expect do
          post logins_url, params: { login: invalid_attributes }
        end.to change(Login, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post logins_url, params: { login: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested login' do
        login = Login.create! valid_attributes
        patch login_url(login), params: { login: new_attributes }
        login.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the login' do
        login = Login.create! valid_attributes
        patch login_url(login), params: { login: new_attributes }
        login.reload
        expect(response).to redirect_to(login_url(login))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        login = Login.create! valid_attributes
        patch login_url(login), params: { login: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested login' do
      login = Login.create! valid_attributes
      expect do
        delete login_url(login)
      end.to change(Login, :count).by(-1)
    end

    it 'redirects to the logins list' do
      login = Login.create! valid_attributes
      delete login_url(login)
      expect(response).to redirect_to(logins_url)
    end
  end
end

