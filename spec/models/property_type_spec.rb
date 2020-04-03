require 'rails_helper'

RSpec.describe PropertyType, type: :model do

  describe 'validations' do
    let(:property_type) { PropertyType.new(name: 'Coworking') }

    it 'can not create another different record by TYPES' do
      expect(property_type).to_not be_valid
    end
  end

end
