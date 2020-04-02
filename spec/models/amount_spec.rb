require 'rails_helper'

RSpec.describe Amount, type: :model do

  describe 'field validations' do
    it 'validates presence of required fields' do
      should validate_presence_of(:price)
    end

    it 'associations' do
      should belong_to(:currency)
      should belong_to(:property)
    end
  end
end
