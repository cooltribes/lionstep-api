class Country < ActiveRecord::Base
  ### Relations
  has_many :cities, foreign_key: "cc_iso", primary_key: "cc_iso"

end
