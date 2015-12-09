class VirtualModel
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def initialize(attrs = {})
    attrs ||= {}
    attrs.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
