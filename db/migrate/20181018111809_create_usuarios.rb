class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.date :dt_nascimento
      t.string :email
      t.integer :ic_adm

      t.timestamps null: false
    end
  end
end
