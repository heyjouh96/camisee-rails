class UsuariosController < ApplicationController
    
    def index 
        @usuarios = Usuario.all     
    end
    
    def create 
        valores = params.require(:usuario).permit!
        
        usuario = Usuario.create valores 
    end
    
end
