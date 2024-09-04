class UserInfo < ActiveRecord::Migration[7.2]
  def change
    add_column :user_infos, :password, :string
  end
end
