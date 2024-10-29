class CreateOvens < ActiveRecord::Migration[5.1]
  def change
    create_table :ovens do |t|
      t.text :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
