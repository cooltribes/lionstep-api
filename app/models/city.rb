class City < ActiveRecord::Base
  ### Relations
  belongs_to :country, foreign_key: "cc_iso", primary_key: "cc_iso"

  ### Class method
  def self.find_or_create(name:, cc_iso:)
    city_name = name.strip
    city = where(name: city_name, cc_iso: cc_iso).first
    unless city
      city = create!(name: city_name.titleize, cc_iso: cc_iso)
    end
    city
  end

end
