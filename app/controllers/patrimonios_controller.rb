class PatrimoniosController < ApplicationController
  # GET /patrimonios
  # GET /patrimonios.xml
  def index
    @patrimonios = Patrimonio.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patrimonios }
      format.pdf do
        patrimonios = Patrimonio.carregar_patrimonios( params[:codigo], params[:titulo], params[:situacao] )
        rel = PatrimonioRelatorio.new
        send_data rel.render( patrimonios ), :filename => "patrimonios.pdf", :type => 'application/pdf', :disposition => 'inline'
      end
    end
  end

  # GET /patrimonios/1
  # GET /patrimonios/1.xml
  def show
    @patrimonio = Patrimonio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patrimonio }
    end
  end

  # GET /patrimonios/new
  # GET /patrimonios/new.xml
  def new
    @patrimonio = Patrimonio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patrimonio }
    end
  end

  # GET /patrimonios/1/edit
  def edit
    @patrimonio = Patrimonio.find(params[:id])
  end

  # POST /patrimonios
  # POST /patrimonios.xml
  def create
    @patrimonio = Patrimonio.new(params[:patrimonio])

    respond_to do |format|
      if @patrimonio.save
        flash[:notice] = 'Patrimonio criado com sucesso.'
        format.html { redirect_to(@patrimonio) }
        format.xml  { render :xml => @patrimonio, :status => :created, :location => @patrimonio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patrimonio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patrimonios/1
  # PUT /patrimonios/1.xml
  def update
    @patrimonio = Patrimonio.find(params[:id])

    respond_to do |format|
      if @patrimonio.update_attributes(params[:patrimonio])
        flash[:notice] = 'Patrimonio salvo com sucesso.'
        format.html { redirect_to(@patrimonio) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patrimonio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patrimonios/1
  # DELETE /patrimonios/1.xml
  def destroy
    @patrimonio = Patrimonio.find(params[:id])
    @patrimonio.destroy

    respond_to do |format|
      format.html { redirect_to(patrimonios_url) }
      format.xml  { head :ok }
    end
  end
  
  def carregar_lst_patrimonio
  	objetos = Patrimonio.carregar_patrimonios( params[:codigo], params[:titulo], params[:situacao] )
  	render :text => montar_html( objetos )
  rescue => e
  	render :text => 'erro'
  end
  
  private
  def montar_html( p_objetos )
  	retorno_html = ''
  	p_objetos.each do |it|
  		retorno_html << "<tr>"
  		retorno_html << "<td>#{it.id}</td>"
  		retorno_html << "<td><a href='/patrimonios/#{it.id}'>#{it.titulo}</a></td>"
  		retorno_html << "<td>#{it.situacao}</td>"
 		retorno_html << "<td><a onclick=\"if (confirm('Tem certeza?')) { var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var m = document.createElement('input'); m.setAttribute('type', 'hidden'); m.setAttribute('name', '_method'); m.setAttribute('value', 'delete'); f.appendChild(m);f.submit(); };return false;\" href='/patrimonios/#{it.id}'><img src='/images/del.gif' onclick='' class='btnEditar' title='Excluir'/></a></td>"
#<%= link_to 'Destroy', patrimonio, :confirm => 'Tem certeza?', :method => :delete %></td>
  		retorno_html << "</tr>"
  	end
  	retorno_html
  end
end
