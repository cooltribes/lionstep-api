require 'rake'


namespace :app do
  desc "load the necesary data to test the app"
  task load_test_data: :environment do
    require 'machinist'
    require Rails.root.join("spec/support/blueprints")

    ##Users
    TestResult.destroy_all
    User.all.each(&:really_destroy!)
    Language.destroy_all
    Skill.destroy_all
    ExtraActivity.destroy_all

    4.times do
      user = User.make!(:confirmed)

      2.times { ProfessionalExperience.make!(user: user) }
      4.times { AcademicExperience.make!(user: user) }

      3.times { user.languages << Language.make! }
      5.times { user.skills << Skill.make! }

      3.times { user.extra_activities << ExtraActivity.make! }

      user.test_result.destroy
      TestResult.make!(user: user)
      user.test_result.update(complete: true)

    end

  end
end