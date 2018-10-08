class AddUserIdToTestcases < ActiveRecord::Migration
  def change
    add_column :testcases, :user_id, :integer
  end
end
