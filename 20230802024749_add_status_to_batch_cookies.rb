class AddStatusToBatchCookies < ActiveRecord::Migration[7.0]
  def change
    add_column :batch_cookies, :status, :integer, null: false, default: 0
  end
end
