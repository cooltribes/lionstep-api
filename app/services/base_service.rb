  class BaseService

    attr_reader :errors

    def valid?
      @valid
    end

    private

    def set_as_invalid!
      @valid = false
    end

    def set_as_valid!
      @valid = true
    end

    def set_errors(errors)
      @errors = errors
    end

    def convert_hashes_in_struct(hashes)
      if hashes.is_a?(Hash)
        OpenStruct.new(hashes)
      elsif hashes.is_a?(Array)
        hashes.map do |hash|
          OpenStruct.new(hash)
        end
      end
    end

    def check_array_of_hashes(collection)
      unless collection.is_a?(Array) && collection.all? {|rec| rec.is_a? Hash }
        set_as_invalid
        raise ArgumentError.new("The collection is not an Array of Hashes")
      end
    end

  end