class V1::Admin::CompaniesController < V1::Admin::BaseController
  before_action :set_company, except: [:index, :create]

  def index
    companies = Company.ransack(params[:q]).result
    companies = Paginator::paginate(companies, params)
    render json: companies, meta: meta_info(companies)
  end

  def show
    render json: @company
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: company, status: :created
    else
      render json: company.errors, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      render json: @company, status: :ok
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    head :no_content
  end

  private

  def company_params
    params.permit(:name, :logo)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
