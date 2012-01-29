class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titulo
      t.text :avances
      t.boolean :terminado
      t.text :commentarios
      t.string :nivel
      t.integer :recomendacion

      t.timestamps
    end
  end
end
