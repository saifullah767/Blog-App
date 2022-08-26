require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/1/posts' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
<<<<<<< HEAD

    it 'renders index template' do
      expect(response).to render_template('index')
    end

    it 'body includes correct placeholder text' do
      expect(response.body).to include('List of all posts for a given user')
    end
=======
    # it 'Correct template was rendered.' do
    #   expect(response).to render_template(:index)
    # end
    # it 'Response status was correct.' do
    #   expect(response).to have_http_status(:ok)
    # end
    # it 'Includes correct placeholder text.' do
    #   expect(response.body).to include('This is all posts of users')
    # end
>>>>>>> 9806e8ececf4a1407ab7d16abda977d4b8f6dfe4
  end

  describe 'GET /show' do
    before(:example) { get '/users/1/posts/1' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders show template' do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Details for a certain posts for a given user')
    end
  end
end
