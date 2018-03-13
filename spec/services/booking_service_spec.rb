# frozen_string_literal: true

require 'rails_helper'

describe BookingService do
  let(:room) { FactoryGirl.create(:room) }
  
  context 'when user enter start date which is booked start date' do
    let(:booking_params) do
      { start: Date.today, end: Date.today + 4, room_id: room.id }
    end

    before do
      FactoryGirl.create(:booking, room: room)
    end
    
    subject { described_class.new(booking_params).call }

    it 'should not create booking and return false' do
      expect(subject).to eq(false)
    end	
  end

  context 'when start date is less than end date' do
    let(:booking_params) do
      { start: Date.today, end: Date.today - 4, room_id: room.id }
    end

    subject { described_class.new(booking_params).call }

    it 'should not create booking and return false' do
      expect(subject).to eq(false)
    end
  end

  context 'when user enter start date  is between booked start date and end date' do
    let(:booking_params) do
      { start: Date.today, end: Date.today + 3, room_id: room.id }
    end

    before do
      FactoryGirl.create(:booking, start: Date.today - 2, room: room)
    end
    subject { described_class.new(booking_params).call }

    it 'should not create booking and return false' do
      expect(subject).to eq(false)
    end
  end

  context 'when user enter end date  is between booked start date and end date' do
    let(:booking_params) do
      { start: Date.today, end: Date.today + 1, room_id: room.id }
    end

    before do
      FactoryGirl.create(:booking, end: Date.today + 4, room: room)
    end
    subject { described_class.new(booking_params).call }

    it 'should not create booking and return false' do
      expect(subject).to eq(false)
    end
  end

  context 'when no booking is done for user enter startdate and enddate' do
    let(:booking_params) do
      { start: Date.today, end: Date.today + 3, room_id: room.id }
    end

    subject { described_class.new(booking_params).call }

    it 'should create booking and return true' do
      expect(subject).to eq(true)
    end
  end
end
