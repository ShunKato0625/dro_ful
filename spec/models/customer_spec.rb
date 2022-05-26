require 'rails_helper'

describe Customer do
  describe '#create' do
    it 'is valid' do
      customer = build(:customer)
      customer.valid?
      expect(customer).to be_valid
    end
  end
end