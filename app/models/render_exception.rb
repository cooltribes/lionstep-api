class RenderException

  attr_reader :custom_message, :status

  def initialize(exception)
    check_exception(exception)
    self
  end

  def to_json(*)
    { errors: custom_message }.to_json
  end

  private

    def check_exception(exception)
      klass = exception.class
      case
      when klass == Pundit::NotAuthorizedError
        @status, @custom_message = 403, { user: ['not authorized'] }
      when klass == ActiveRecord::RecordNotFound
        @status, @custom_message = 404, { record: ['not found'] }
      when klass == ApiError::PolymorphicModelParamsNotFound
        @status, @custom_message = 404, { params: ['for polymorphic model not found'] }
      else
        # Rollbar.error(exception)
        if Rails.env.production?
          @status, @custom_message = 500, { server: ['error'] }
        else
          raise exception
        end
      end
    end

end


