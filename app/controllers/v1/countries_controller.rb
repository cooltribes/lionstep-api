class V1::CountriesController < V1::BaseController
  # skip_before_action :authenticate_user!

  def index
    countries = Country.ransack(name_cont: params[:term]).result
    render json: countries.as_json(only:[:name, :cc_iso])
  end

  def show
    country = Country.find_by(cc_iso: params[:country_code])
    cities = country.cities.ransack(name_cont: params[:term]).result
    render json: cities.as_json(only:[:name, :cc_iso])
  end
end