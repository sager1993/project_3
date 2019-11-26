class AddImgToCause < ActiveRecord::Migration[5.2]
  def change
    add_column :causes, :img, :string
  end
end
