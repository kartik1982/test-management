class CreateTestsuites < ActiveRecord::Migration
  def change
    create_table :testsuites do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
