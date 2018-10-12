class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :type
      t.string :name
      t.text :description
      t.boolean :status
      t.integer :user_id
      t.integer :group_id
    end
  end
end
