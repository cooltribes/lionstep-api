class Country < ActiveRecord::Base
  ### Relations
  has_many :cities, foreign_key: "cc_iso", primary_key: "cc_iso"

  def text_name
    I18n.t("country.#{cc_iso}")
  end

end
