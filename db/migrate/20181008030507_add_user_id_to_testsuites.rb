class AddUserIdToTestsuites < ActiveRecord::Migration
  def change
    add_column :testsuites, :user_id, :integer
  end
end
