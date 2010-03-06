require "pdf/simpletable"
class PatrimonioRelatorio
  def initialize
    @pdf = PDF::Writer.new( :paper => 'A4', :orientation => :landscape )
  end
  
  def render( p_patrimonios )
    #@pdf = PDF::Writer.new( :paper => 'A4' )
    @pdf.select_font("Helvetica")    
    
    #Rodapé
    nmr_tamanho_fonte_rodape = 6
    @pdf.start_page_numbering(@pdf.margin_x_middle, 15, nmr_tamanho_fonte_rodape, :center, '<PAGENUM>', 1)
    
    @pdf.open_object do |footer|
      @pdf.save_state
      @pdf.stroke_color! Color::RGB::Black
#      @pdf.stroke_style! @pdf::Writer::StrokeStyle.new(0.25)			
      @pdf.line(@pdf.absolute_left_margin, 25, @pdf.absolute_right_margin, 25).stroke
      
      txt_hora_impressao = Time.now.strftime("%d/%m/%Y %H:%M")
      w = @pdf.absolute_right_margin - @pdf.text_width(txt_hora_impressao, nmr_tamanho_fonte_rodape)
      @pdf.add_text_wrap(w, 14, 200, txt_hora_impressao, nmr_tamanho_fonte_rodape)
      
      @pdf.restore_state
      @pdf.close_object
      @pdf.add_object(footer, :all_pages)
    end
    
    montar_cabecalho
    montar_tabela( p_patrimonios )
#    dados( p_patrimonios )
    
    @pdf.compressed = true
    
    @pdf.render
  end
  
  def dados( p_patrimonios )
    if !p_patrimonios.nil?
      p_patrimonios.each do |objeto|
        @pdf.text objeto.titulo.to_s
      end
    else
      @pdf.text "Não possui dados cadastrados.", :left => 20, :font_size => 8
    end
  end
  
  def montar_tabela ( p_patrimonios )
    table = PDF::SimpleTable.new
#    table.title = "Sample Tables"
   
    colunas_tabela = ["id", "titulo", "situacao", "dsc_estado_fisico", "tipo_conector", "dsc_segmento", "voltagem", "created_at"]
    colunas_apres  = ["Código", "Título", "Situação", "Estado Físico", "Tipo Conector", "Segmento", "Voltagem", "Cadastro"]
    table.column_order.push(*colunas_tabela)
    
    colunas_tabela.each_with_index do |c, i|
      table.columns[c] = PDF::SimpleTable::Column.new(c)
      table.columns[c].heading = colunas_apres[i]
    end      
    
    table.show_lines    = :all
    table.show_headings = true
    table.orientation   = :center
    table.position      = :center
    
    data = []
    p_patrimonios.each do |x|
      h = Hash.new
      colunas_tabela.each{|col| h[col] = x.send(col) }
      data << h
    end
    
    table.data.replace data
    table.render_on(@pdf)
  end

  def montar_cabecalho
    dir_raiz_imagem = "http://libwebdes.lbv.org.br/img/Onda_sem_logon.jpg"

#    @pdf.add_image_from_file( dir_raiz_imagem, 0, 772 )
    @pdf.save_state
    @pdf.fill_color  Color::RGB::White
    @pdf.text 'Lista de Patrimônios', :left => 50, :leading => 1, :font_size => 20
    @pdf.restore_state
  end
  
  

end