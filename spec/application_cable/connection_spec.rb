# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationCable::Connection, type: :channel do
  it 'connects with cookies' do
    #   cookies.signed[:user_id] = 42
    #
    #   connect
    #
    #   expect(connection.user_id).to eq("42")
  end
end
