module ConcertoManykinds
  class Manykind < ActiveRecord::Base
    include ActiveModel::ForbiddenAttributesProtection

    belongs_to :field
    belongs_to :kind
    belongs_to :template
    
    def self.form_attributes
      attributes = [:field_id, :template_id,  :kind_id]
    end

    def self.kinds_for(template_id, field_id)
      Manykind.where(:template_id => template_id, :field_id => field_id)
    end

  end
end
