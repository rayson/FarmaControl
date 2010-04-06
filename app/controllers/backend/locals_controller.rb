class Backend::LocalsController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Local do |cm|
      cm.add :nome
      cm.add :empresa
      cm.add :sigla
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
    @local = Local.new
  end

  def create
    @local = Local.new(params[:local])
    if @local.save
      redirect_parent_to(:action => "edit", :id => @local)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @local = Local.find(params[:id])
  end

  def update
    @local = Local.find(params[:id]) 
    
    if @local.update_attributes(params[:local])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @local) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @local.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Local.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end