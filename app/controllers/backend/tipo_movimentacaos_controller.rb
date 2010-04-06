class Backend::TipoMovimentacaosController < BackendController

  def index
    params[:limit] ||= 50
    #TODO Verificar se nao existe a origem ou o destino e colocar um símbolo caso nao tenha
    @column_store = column_store_for TipoMovimentacao do |cm|
      cm.add :nome
      cm.add "origem.nome", :header=> "Origem"
      cm.add "destino.nome", :header=> "Destino"
      cm.add :created_at, :renderer => :datetime 
      cm.add :updated_at, :renderer => :datetime 
    end
    
    respond_to do |format|
      format.js 
      format.json do
        render :json => @column_store.store_data(params)
      end
    end
  end

  
  def new
    @tipo_movimentacao = TipoMovimentacao.new
  end

  def create #OPTIMIZE
    @tipo_movimentacao = TipoMovimentacao.new(params[:tipo_movimentacao])
    if @tipo_movimentacao.save
      params[:hidden_save_new].blank? ? redirect_parent_to(:action => "edit", :id => @tipo_movimentacao): render_to_parent(:action => "new")
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @tipo_movimentacao = TipoMovimentacao.find(params[:id])
  end

  def update
    @tipo_movimentacao = TipoMovimentacao.find(params[:id]) 
    
    if @tipo_movimentacao.update_attributes(params[:tipo_movimentacao])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @tipo_movimentacao) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @tipo_movimentacao.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if TipoMovimentacao.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end