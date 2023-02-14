require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe '/にアクセスした時に' do
    it 'HTTPステータスが200を返すこと' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end
end
