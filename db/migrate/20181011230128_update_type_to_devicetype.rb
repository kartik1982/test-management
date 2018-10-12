class UpdateTypeToDevicetype < ActiveRecord::Migration
  def change
    rename_column :devices, :type, :devicetype
  end
end
