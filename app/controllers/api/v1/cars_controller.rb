class Api::V1::CarsController < Api::BaseController
  before_action :vehicle_service

  # Get All Makes
  def get_all_makes
    render json: vehicle_service.get_all_makes
  end

  # Get Models for MakeId
  def get_models_for_make_id
    render json: vehicle_service.get_models_for_make_id(params[:make_id])
  end

  # Get Models for Make Id and a combination of Year
  def get_models_for_make_id_year
    render json: vehicle_service.get_models_for_make_id_year(params[:make_id], params[:make_year])
  end

  private

  # vehicle api service
  def vehicle_service
    VehicleApiService.new
  end
end
