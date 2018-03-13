# frozen_string_literal: true

require 'rails_helper'

describe 'Booking', type: :request do
  let!(:room) { Room.create(number: 1) }
  let(:test_params) do
    { room_id: room.id, start: Date.today, end: Date.today + 3 }
  end
  

  context 'when no other booking is done on desired date' do
    before do
      post room_bookings_path(room.id), params: test_params
    end

    it 'should create a room booking' do
      result = ActiveSupport::JSON.decode(response.body).symbolize_keys
      expect(response).to have_http_status(:success)
      expect(result).to eq(message: 'Booking created.')
    end
  end

  context 'when booking has conflict' do
    before do
      room.bookings.create!(start: Date.today, end: Date.today + 3)
      post room_bookings_path(room.id), params: test_params
    end

    it 'should not create a room booking' do
      result = ActiveSupport::JSON.decode(response.body).symbolize_keys
      expect(response).to have_http_status(:unprocessable_entity)
      expect(result).to eq(message: 'Booking conflict.')
    end

  end
end
