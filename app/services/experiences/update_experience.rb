module Experiences
  class UpdateExperience < BaseService

    attr_reader :experience, :user, :params

    def initialize(user, experience, params)
      set_as_valid!
      @user = user
      @experience = experience
      @params = params
    end

    def call
      skills = params.delete(:skills)
      if @experience.update(params)
        @experience.skills = find_or_create_skills(skills) if skills.present?
        set_as_valid!
      else
        set_as_invalid!
        set_errors @experience.errors
      end
      valid?
    end

    private

    def find_or_create_skills(skill_names)
      skills = sanitize_name(skill_names)
      skills.each_with_object([]) do |name, array|
        skill = Skill.find_or_create_by(name: name)
        array << skill if skill
      end
    end

    def sanitize_name(skill_names)
      skill_names.map(&:strip)
    end
  end
end