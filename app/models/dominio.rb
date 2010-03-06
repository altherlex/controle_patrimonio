class Dominio < ActiveRecord::Base
  class << self
    def carregar_segmento
      find(:all, :conditions => 'grupo = 1')
    end
    def carregar_estado_fisico
      find(:all, :conditions => 'grupo = 2')
    end
    
    def carregar_por_grupo_e_valor(p_grupo, p_valor)
      find(:first, :conditions => ['grupo = ? AND valor = ?', p_grupo.to_i, p_valor.to_s ]).conteudo
    end
    
  end
end
