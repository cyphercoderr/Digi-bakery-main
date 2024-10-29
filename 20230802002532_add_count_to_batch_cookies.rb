class AddCountToBatchCookies < ActiveRecord::Migration[7.0]
  def change
    add_column :batch_cookies, :count, :integer, null: false, default: 1
  end
end
