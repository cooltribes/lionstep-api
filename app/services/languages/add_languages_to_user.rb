module Languages
  class AddLanguagesToUser < BaseService

    attr_reader :user, :array_of_hashes

    def initialize(user, array_of_hashes)
      set_as_valid!
      check_array_of_hashes(array_of_hashes)
      @user = user
      @array_of_hashes = array_of_hashes
    end

    def call
      levels = find_languages_and_create_levels(array_of_hashes)
      user.language_levels = levels
      valid?
    end

    def language_levels
      user.language_levels
    end

    private

    def find_languages_and_create_levels(array_of_hashes)
      new_levels = convert_hashes_in_struct(array_of_hashes)
      new_levels.each_with_object([]) do |level, array|
        language = Language.find(level.language_id)
        array << LanguageLevel.create!(language: language, level: level.level) if language
      end
    end
  end
end