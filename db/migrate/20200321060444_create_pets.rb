class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :image
      t.string :name
      t.integer :approx_age
      t.string :sex
      t.string :sheltered_at
    end
  end
end
