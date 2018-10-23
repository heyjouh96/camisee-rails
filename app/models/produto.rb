class Produto < ActiveRecord::Base
    
    validates :nome, length: { minimum: 5 }
    validates :quantidade, presence: true
    validates :preco, presence: true
    
end
