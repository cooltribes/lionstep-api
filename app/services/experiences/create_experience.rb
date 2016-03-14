module Experiences
  class CreateExperience < BaseService

    attr_reader :experience, :user, :params

    def initialize(user, params, type: "professional")
      set_as_valid!
      @user = user
      @params = params
      @type = type
    end

    def call
      skills = params.delete(:skills)
      @experience = new_experience(params)
      if @experience.save
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

    def new_experience(params)
      params.merge!(user: user)
      case @type
      when "professional"
        ProfessionalExperience.new(params)
      when "academic"
        AcademicExperience.new(params)
      else
        raise "Experience Type Error"
      end
    end
  end
end