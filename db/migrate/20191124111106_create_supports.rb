class CreateSupports < ActiveRecord::Migration[5.2]
  def change
    create_table :supports do |t|
      t.string :title
      t.string :body
      t.references :user, foreign_key: true
      t.references :cause, foreign_key: true

      t.timestamps
    end
  end
end
