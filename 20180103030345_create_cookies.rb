class CreateCookies < ActiveRecord::Migration[5.1]
  def change
    create_table :cookies do |t|
      t.text :fillings
      t.references :storage, polymorphic: true

      t.timestamps
    end
  end
end
