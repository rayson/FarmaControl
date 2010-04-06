class Backend::FarmacosController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Farmaco do |cm|
      cm.add :farmaco, :editor=> {:xtype=> :textfield}
      cm.add "forma.sigla", :header=> 'Forma'#, :editor=> {:xtype=> :combobox}
      cm.add :controlado, :header => "Portaria 344"
      cm.add :padronizado, :header => "Padronizado"
      cm.add :created_at, :renderer => :datetime 
      cm.add :updated_at, :renderer => :datetime

    end
    
    respond_to do |format|
      format.js 
      format.json do
        render :json => @column_store.store_data(params, {:joins=> :forma})
      end
    end
  end

  
  def new
    @farmaco = Farmaco.new
  end

  def create
    @farmaco = Farmaco.new(params[:farmaco])
    if @farmaco.save
      redirect_parent_to(:action => "edit", :id => @farmaco)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @farmaco = Farmaco.find(params[:id])
  end

  def update
    @farmaco = Farmaco.find(params[:id]) 
    
    if @farmaco.update_attributes(params[:farmaco])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @farmaco) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @farmaco.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Farmaco.find(params[:id]).delete
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end