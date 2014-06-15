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
    validate :cannot_be_same_as_primary

    def cannot_be_same_as_primary
      if template_id.present? && field_id.present? && kind_id.present?
        p = Position.where(:template_id => template_id, :field_id => field_id).first
        if !p.nil? and p.field.kind_id == kind_id
          errors.add(:kind_id, 'already mapped via template definition')
        end
      end
    end

    def self.form_attributes
      attributes = [:field_id, :template_id,  :kind_id]
    end

    def self.kinds_for(template_id, field_id)
      Manykind.where(:template_id => template_id, :field_id => field_id)
    end

  end
end
