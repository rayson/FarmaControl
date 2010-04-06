class Backend::EstoquesController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Estoque do |cm|
      cm.add "farmaco.farmaco", :header=> "Farmaco"
      cm.add "local.sigla", :header=> "Local"#, :dataIndex=> ["local.nome", "local.sigla"]
      cm.add :quantidade, :editor=> {:xtype=> :textfield}
      cm.add :created_at, :renderer => :datetime 
      cm.add :updated_at, :renderer => :datetime 
    end
    
    respond_to do |format|
      format.js 
      format.json do
        render :json => @column_store.store_data(params, :joins=>[:farmaco, :local])
      end
    end
  end

  
  def new
    @estoque = Estoque.new
  end

  def create
    @estoque = Estoque.new(params[:estoque])
    if @estoque.save
      redirect_parent_to(:action => "edit", :id => @estoque)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @estoque = Estoque.find(params[:id])
  end

  def update
    @estoque = Estoque.find(params[:id]) 
    
    if @estoque.update_attributes(params[:estoque])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @estoque) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @estoque.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Estoque.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end

  def move
    render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
  end
end