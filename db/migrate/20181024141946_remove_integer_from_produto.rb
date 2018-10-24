class RemoveIntegerFromProduto < ActiveRecord::Migration
  def change
    remove_column :produtos, :integer, :string
  end
end
