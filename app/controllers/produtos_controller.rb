class ProdutosController < ApplicationController
    
    before_action :set_produto, only: [:edit, :update, :destroy]
    
    def index
        @produtos_nome = Produto.order(:nome).limit 2
        @produtos_qtd = Produto.order :quantidade
    end
    
    def new
        @produto = Produto.new
        renderiza :new
    end
    
    def create
    #   nome = params["nome"]
    #   descricao = params["descricao"]
    #   quantidade = params["quantidade"]
    #   preco = params["preco"]
        
        # faz o mesmo do de cima só que de uma vez
        # valores = params.require(:produto).permit! 
        valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
        @produto = Produto.new valores
        
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso! "
            redirect_to root_url
        else
           renderiza :new
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
    
    def edit
        renderiza :edit
    end
    
    def update
        valores = params.require(:produto).permit!
        if @produto.update valores
            flash[:notice] = "Produto atualizado com sucesso!"
            redirect_to root_url
        else
            renderiza :edit
        end
    end
    
    def destroy
        @produto.destroy 
        
        redirect_to root_url 
    end
    
    def busca
        @busca = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@busca}%"
    end
    
    private 
    
    def renderiza(view)
        @departamentos = Departamento.all
        render view
    end
    
    def set_produto 
        id = params[:id]
        @produto = Produto.find(id)
    end
    
end
