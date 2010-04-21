class Backend::MovimentacaosController < BackendController

  before_filter :get_farmaco

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Movimentacao do |cm|
      cm.add "farmaco.farmaco", :header=>"Farmaco"
      cm.add "tipo_movimentacao.nome", :header=>"Tipo Movimentacao"
      cm.add :quantidade
      cm.add :observacao
      cm.add :created_at, :renderer => :datetime 
      cm.add :updated_at, :renderer => :datetime 
    end
    
    respond_to do |format|
      format.js 
      format.json do
        render :json => @column_store.store_data(params, :joins=>[:farmaco, :tipo_movimentacao])
      end
    end
  end

  
  def new
    @movimentacao = @farmaco.movimentacaos.new
  end

  def create
    @movimentacao = @farmaco.movimentacaos.new(params[:movimentacao])
    if @movimentacao.save
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @movimentacao) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @movimentacao.errors.full_messages.join("<br />") } }
      end
    end
  end

  def edit
    @movimentacao = Movimentacao.find(params[:id])
  end

  def update
    @movimentacao = Movimentacao.find(params[:id]) 
    
    if @movimentacao.update_attributes(params[:movimentacao])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @movimentacao) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @movimentacao.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Movimentacao.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end

  private

  def get_farmaco
    params[:farmaco_id] && (@farmaco= Farmaco.find(params[:farmaco_id]))
  end
end