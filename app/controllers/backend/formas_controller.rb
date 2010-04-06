class Backend::FormasController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Forma do |cm|
      cm.add :texto
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
    @forma = Forma.new
  end

  def create
    @forma = Forma.new(params[:forma])
    if @forma.save
      redirect_parent_to(:action => "edit", :id => @forma)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @forma = Forma.find(params[:id])
  end

  def update
    @forma = Forma.find(params[:id]) 
    
    if @forma.update_attributes(params[:forma])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @forma) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @forma.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Forma.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end