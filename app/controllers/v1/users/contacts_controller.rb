class V1::Users::ContactsController < V1::BaseController
  before_action :set_contactable
  before_action :set_contact, except: [:index, :create, :batch]

  def index
    contacts = @contactable.contacts
    render json: contacts
  end

  def create
    authorize Contact
    contact = @contactable.contacts.build(contact_params)
    if contact.save
      render json: contact, status: :created
    else
      render json: {errors: contact.errors}, status: :unprocessable_entity
    end
  end

  def batch
    authorize Contact, :create?
    service = ::Contacts::SaveInBatch.new(@contactable, batch_params.fetch(:contacts))
    if service.call
      render json: service.contactable_contacts, status: :ok
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @contact
    if @contact.update(contact_params)
      render json: @contact, status: :ok
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @contact
    @contact.destroy
    head :no_content
  end

  private
  def set_contactable
    @contactable = User.find(params[:user_id])
  end

  def set_contact
    @contact = @contactable.contacts.find(params[:id])
  end

  def contact_params
    params.permit(:info, :contact_type, :privacy)
  end

  def batch_params
    params.permit(contacts: [:info, :contact_type, :privacy])
  end

  def pundit_user
    PolymorphicContext.new(current_user, @contactable)
  end

end
