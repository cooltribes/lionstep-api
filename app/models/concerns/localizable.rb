module Localizable
  extend ActiveSupport::Concern

  included do
    belongs_to :country, class_name: "Country", foreign_key: "country_code", primary_key: "cc_iso"
    before_save :find_or_create_city
  end

  private

  def find_or_create_city
    if self.city.present?
      city = City.find_or_create(name: self.city, cc_iso: self.country_code)
      self.city = city.name
    end
  end
end
