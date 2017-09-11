class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer   :user_id
      t.string    :first_name
      t.string    :last_name
      t.string    :avatar
      t.date      :bd
      t.string    :about
      t.string    :interests
      t.string    :telephone
      t.timestamps
    end
  end
end
