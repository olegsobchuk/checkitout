class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.references :project, index: true
      t.text :spec

      t.timestamps null: false
    end
  end
end
