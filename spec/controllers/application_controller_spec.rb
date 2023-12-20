# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'error handling' do
    describe 'handle_connection_error' do
      controller do
        def index
          raise EOFError
        end
      end

      it 'redirects to home index with http error alert' do
        get :index
        expect(response).to redirect_to(home_index_path)
        expect(flash[:alert]).to eq(I18n.t('errors.alerts.http_error'))
      end
    end

    describe 'handle_invalid_search_query_error' do
      controller do
        def index
          raise ApiRecordCollection::InvalidSearchQueryError
        end
      end

      it 'redirects to home index with invalid search query alert' do
        get :index
        expect(response).to redirect_to(home_index_path)
        expect(flash[:alert]).to eq(I18n.t('errors.alerts.invalid_search_query'))
      end
    end

  end
end
