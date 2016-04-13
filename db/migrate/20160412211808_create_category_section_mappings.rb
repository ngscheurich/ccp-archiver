class CreateCategorySectionMappings < ActiveRecord::Migration
  def change
    create_table :category_section_mappings do |t|
      t.string :category
      t.string :subcategory
      t.string :section

      t.timestamps null: true
    end

    add_index :category_section_mappings, [:category, :subcategory]
  end
end
