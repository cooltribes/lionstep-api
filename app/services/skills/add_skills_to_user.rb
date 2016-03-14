module Skills
  class AddSkillsToUser < BaseService

    attr_reader :user, :user_skills_collection

    def initialize(user, user_skills_collection)
      set_as_valid!
      check_array_of_hashes(user_skills_collection)
      @user = user
      @user_skills_collection = user_skills_collection
    end

    def call
      find_or_create_skills
      valid?
    end

    def user_skills
      user.user_skills
    end

    private

    def find_or_create_skills
      new_user_skills = sanitanize_collection(user_skills_collection)
      new_user_skills = convert_hashes_in_struct(new_user_skills)
      new_user_skills.each_with_object([]) do |user_skill, array|
        skill = Skill.find_or_create_by(name: user_skill.name)
        UserSkill.create!(user: user, skill: skill, level: user_skill.level) if skill
      end
    end

    def sanitanize_collection(collection)
      collection.each do |skill_level|
        skill_level[:name].strip!
      end
    end
  end
end