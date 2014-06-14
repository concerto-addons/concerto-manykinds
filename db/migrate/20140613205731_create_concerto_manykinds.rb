class CreateConcertoManykinds < ActiveRecord::Migration
  def change
    create_table :concerto_manykinds_manykinds do |t|
      t.integer :field_id
      t.integer :kind_id
      t.integer :template_id

      t.timestamps
    end
  end
end
