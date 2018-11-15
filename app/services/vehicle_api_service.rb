require 'open-uri'

class VehicleApiService

  #call Vehicle API
  def call url
    api_call = "#{base_uri}/#{url}?format=json"
    Rails.cache.fetch(api_call, :expires => 1.days) do
      JSON.parse open(api_call).read
    end
  end

  # Methods to call api for different path
  def get_all_makes
    call('/vehicles/GetAllMakes')
  end

  def get_models_for_make_id(id)
    call("/vehicles/GetModelsForMakeId/#{id}")
  end

  def get_models_for_make_id_year(id, year)
    call("/vehicles/GetModelsForMakeIdYear/makeId/#{id}/modelyear/#{year}")
  end

  private

  def base_uri
    'https://vpic.nhtsa.dot.gov/api'
  end
end
