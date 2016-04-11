class TestResult < ActiveRecord::Base
  ### Relations
  belongs_to :user

  ### Callbacks
  before_update :check_completed

  ### Instance Methods

  def get_results
    TestProcessador.type_information[result] if complete
  end

  def adjetives_pluralized(locale="es")
    locale = locale.to_sym
    if complete
      first_adjetive, conector, last_adjetive = get_results[:adjetives].split(" ")
      "#{first_adjetive.pluralize(locale)} #{conector} #{last_adjetive.pluralize(locale)}"
    end
  end

  private

  def check_completed
    if complete_changed?(from: false, to: true)
      test = TestProcessador.new(self)
      self.result = test.type
      ApplicationMailer.test_completed(user).deliver_later
    end
  end

end
