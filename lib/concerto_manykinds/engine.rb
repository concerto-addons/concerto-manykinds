module ConcertoManykinds
  class Engine < ::Rails::Engine
    isolate_namespace ConcertoManykinds

    # The engine name will be the name of the class
    # that contains the URL helpers for our routes.
    engine_name 'manykindsengine'

    def plugin_info(plugin_info_class)
      @plugin_info ||= plugin_info_class.new do
        
        # Make the engine's controller accessible at /manykinds
        add_route("manykinds", ConcertoManykinds::Engine)

        # Some code to run at app boot
        init do
          Rails.logger.info "ConcertoManykinds: Initialization code is running"
        end

        # show the details alongside each template

        add_controller_hook "TemplatesController", :show, :before do
          @manykinds = Manykind.where(:template_id => @template.id)
        end

        add_view_hook "TemplatesController", :sidebar, :partial => "concerto_manykinds/templates/details"

        # # show that the template is in use
  
        # add_controller_hook "TemplatesController", :show, :before do
        #   @schedules = Schedule.where(:template_id => @template.id)
        # end

        # add_view_hook "TemplatesController", :template_details, :partial => "concerto_template_scheduling/templates/in_use_by"

        # override the filtering by using an around filter and not yielding to it
        add_controller_hook "Subscription", :filter_contents, :around do
          allowed_kinds = Manykind.kinds_for(self.screen.template.id, self.field.id).collect {|r| r.kind_id }
          allowed_kinds << self.field.kind.id
          @contents.reject!{|c| !allowed_kinds.include?(c.kind_id)}
        end
      end
    end
  end
end
