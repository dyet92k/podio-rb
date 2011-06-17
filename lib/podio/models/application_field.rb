class Podio::ApplicationField < ActivePodio::Base
  property :field_id, :integer
  property :type, :string
  property :external_id, :integer
  property :config, :hash

  alias_method :id, :field_id
  delegate_to_hash :config, :label, :description, :delta, :settings, :required?, :visible?
  delegate_to_hash :settings, :allowed_values, :referenceable_types, :allowed_currencies, :valid_types
  
  class << self
    def find(app_id, field_id)
      member Podio.connection.get("/app/#{app_id}/field/#{field_id}").body
    end
    
  end
end