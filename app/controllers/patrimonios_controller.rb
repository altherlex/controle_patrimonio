class PatrimoniosController < ApplicationController
  # GET /patrimonios
  # GET /patrimonios.xml
  def index
    @patrimonios = Patrimonio.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patrimonios }
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
        flash[:notice] = 'Patrimonio was successfully created.'
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
        flash[:notice] = 'Patrimonio was successfully updated.'
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
end
