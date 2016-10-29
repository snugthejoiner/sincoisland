class FixLocalityColumnName < ActiveRecord::Migration
  def change
    rename_column :localities, :type, :locality_type
  end
end
