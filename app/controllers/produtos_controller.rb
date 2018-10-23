class ProdutosController < ApplicationController
    
    def index
        @produtos_nome = Produto.order(:nome).limit 2
        @produtos_qtd = Produto.order :quantidade
    end
    
    def new
        @produto = Produto.new
    end
    
    def create
    #   nome = params["nome"]
    #   descricao = params["descricao"]
    #   quantidade = params["quantidade"]
    #   preco = params["preco"]
        
        # faz o mesmo do de cima só que de uma vez
        # valores = params.require(:produto).permit! 
        valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade
        @produto = Produto.new valores
        
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso! "
            redirect_to root_url
        else
           render :new  
        end
    end
    
    def show 
        id = params[:id]
        if !Produto.exists?(id: id)
           render :page_404 
        else
            @produto = Produto.find(id)
        end
    end
    
    def destroy
        id = params[:id]
        Produto.destroy id
        
        redirect_to root_url 
    end
    
    def busca
        @busca = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@busca}%"
    end
    
end
