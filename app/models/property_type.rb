class PropertyType < ApplicationRecord
  TYPES = ['Casa', 'Oficina', 'Departamento', 'Local']

  validates :name, presence: true, uniqueness: true
  validate :validate_name

  def validate_name
    errors.add(:name, 'should be allowed in name types') unless TYPES.include?(name)
  end

end
