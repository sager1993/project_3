class AddNameToCauses < ActiveRecord::Migration[5.2]
  def change
    add_column :causes, :name, :string
  end
end
