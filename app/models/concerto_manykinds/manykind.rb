module ConcertoManykinds
  class Manykind < ActiveRecord::Base
    include ActiveModel::ForbiddenAttributesProtection

    belongs_to :field
    belongs_to :kind
    belongs_to :template
    
    validates :field_id, :presence => true
    validates :kind_id, :presence => true
    validates :template_id, :presence => true
    validates_uniqueness_of :kind_id, :scope => [:template_id, :field_id]

    # TODO dont allow record if already exists in position field mapping

    def self.form_attributes
      attributes = [:field_id, :template_id,  :kind_id]
    end

    def self.kinds_for(template_id, field_id)
      Manykind.where(:template_id => template_id, :field_id => field_id)
    end

  end
end
