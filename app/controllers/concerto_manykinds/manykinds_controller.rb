require_dependency 'concerto_manykinds/application_controller'

module ConcertoManykinds
  class ManykindsController < ApplicationController
    def create
      @manykind = Manykind.new(manykind_params)
      auth! action: :update, object: @manykind.template
      respond_to do |format|
        if @manykind.save
          format.html { redirect_to @manykind, notice: 'Kind was successfully created.' }
          format.json do
            item_html = render_to_string(partial: 'concerto_manykinds/templates/item', object: @manykind, formats: [:html])
            render json: { field_id: @manykind.field.id, item_html: item_html }, status: :created, location: @manykind
          end
        else
          format.html { render action: 'new' }
          format.json { render json: @manykind.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @manykind = Manykind.find(params[:id])
      auth! action: :update, object: @manykind.template
      @manykind.destroy

      respond_to do |format|
        format.html { redirect_to manykindsengine.manykinds_url }
        format.json { head :no_content }
      end
    end

    def manykind_params
      params.require(:manykind).permit(*ConcertoManykinds::Manykind.form_attributes)
    end
  end
end
