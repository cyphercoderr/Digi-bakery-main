class RenameCookiesToBatchCookies < ActiveRecord::Migration[7.0]
  def change
    rename_table :cookies, :batch_cookies
  end
end
