class CreateUserInfos < ActiveRecord::Migration[7.2]
  def change
    create_table :user_infos do |t|
      t.string :FirstName
      t.string :LastName
      t.date :DateOfBirth
      t.string :Gender
      t.string :Email
      t.string :PhoneNumber
      t.string :Subject

      t.timestamps
    end
  end
end
