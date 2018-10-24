class RemoveDepartamentoIdFromProduto < ActiveRecord::Migration
  def change
    remove_column :produtos, :departamento_id, :string
  end
end
