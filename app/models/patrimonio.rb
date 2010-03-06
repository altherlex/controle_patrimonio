class Patrimonio < ActiveRecord::Base
	
	ATIVO 	= 'A'
	INATIVO = 'I'
	TODOS 	= 'T'

	def situacao
		case self[:situacao]
		  when ATIVO
			'Ativo'
		  when INATIVO
			'Inativo'
		end
	end
	
	def created_at
	 self[:created_at].strftime("%d/%m/%Y %H:%M") rescue ''
	end
	
	def dsc_segmento
	 Dominio.carregar_por_grupo_e_valor(1, self[:segmento]) rescue ''
	end
	
	def dsc_estado_fisico
	 Dominio.carregar_por_grupo_e_valor(2, self[:estado_fisico]) rescue ''
	end
	
	
	
	def ativo?
	 self[:situacao] == ATIVO
	end

	class << self
	
		def carregar_patrimonios(p_codigo = nil, p_titulo = nil, p_situacao = nil)
			arr_condicoes = []
			
			if !p_codigo.nil_or_blank?
				arr_condicoes << ["id = ?", p_codigo]
			else
				arr_condicoes << ["titulo like ?", "%#{p_titulo}%"]		if !p_titulo.nil_or_blank?
				if !p_situacao.nil_or_blank?
					if p_situacao == TODOS
#						arr_condicoes << ["situacao IN (?, ?) OR ", ATIVO, INATIVO ]
					else
						arr_condicoes << ["situacao = ?", p_situacao]
					end
				end
			end
			
			find(:all, 
				:conditions => ActiveRecord::Base.merge_conditions( *arr_condicoes ),
				:order => 'titulo')
		end
		
	end
end
