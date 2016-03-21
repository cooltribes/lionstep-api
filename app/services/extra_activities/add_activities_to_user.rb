module ExtraActivities
  class AddActivitiesToUser < BaseService

    attr_reader :user, :user_activities_collection

    def initialize(user, user_activities_collection)
      set_as_valid!
      check_array_of_hashes(user_activities_collection)
      @user = user
      @user_activities_collection = user_activities_collection
    end

    def call
      find_or_create_activiy
      valid?
    end

    def user_extra_activities
      user.user_extra_activities
    end

    private

    def find_or_create_activiy
      new_activites = sanitanize_collection(user_activities_collection)
      new_activites = convert_hashes_in_struct(new_activites)
      new_activites.each_with_object([]) do |activity, array|
        xactivity = ExtraActivity.find_or_create_by(name: activity.name)
        UserExtraActivity.create!(user: user, extra_activity: xactivity, level: activity.level) if xactivity
      end
    end

    def sanitanize_collection(collection)
      collection.each do |record|
        record[:name].strip!
      end
    end
  end
end