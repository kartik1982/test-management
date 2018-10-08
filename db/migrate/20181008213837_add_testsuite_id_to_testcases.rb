class AddTestsuiteIdToTestcases < ActiveRecord::Migration
  def change
    add_column :testcases, :testsuite_id, :integer
  end
end
