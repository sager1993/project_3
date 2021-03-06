class CreateCauses < ActiveRecord::Migration[5.2]
  def change
    create_table :causes do |t|
      t.string :description
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
