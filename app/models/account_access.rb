class AccountAccess < Lipsiadmin::AccessControl::Base 

  roles_for :administrator do |role, current_account|
    # Shared Permission
    role.allow_all_actions "/backend"
    role.allow_all_actions "/backend/base"
    
    # Remember that it will try to translate the menu in your current
    # locale
    # 
    #   # Look for: I18n.t("backend.menus.account") in /config/locales/backend/yourlocale.yml
    #   project_module :account
    #   # Look for: I18n.t("backend.menus.list") in /config/locales/backend/yourlocale.yml
    #   project.menu :list
    # 
    # It not necessary have a translation you can provide a classic strings like:
    # 
    #   role.project_module "My Menu Name"
    # 
    # <tt>current_account</tt> is an instance of current logged account
    # 
    role.project_module :account do |project|
      project.menu :list,   "/backend/accounts.js" do |submenu|
        submenu.add :new, "/backend/accounts/new"
      end
    end
    
    # Please don't remove this comment! It's used for auto adding project modules
    role.project_module :tipo_movimentacaos do |project|
      project.menu :list,   "/backend/tipo_movimentacaos.js" do |submenu|
        submenu.add :new, "/backend/tipo_movimentacaos/new"
      end
    end 

    role.project_module :movimentacaos do |project|
      project.menu :list,   "/backend/movimentacaos.js" do |submenu|
        submenu.add :new, "/backend/movimentacaos/new"
      end
    end 

    role.project_module :locals do |project|
      project.menu :list,   "/backend/locals.js" do |submenu|
        submenu.add :new, "/backend/locals/new"
      end
    end 

    role.project_module :estoques do |project|
      project.menu :list,   "/backend/estoques.js" do |submenu|
        submenu.add :new, "/backend/estoques/new"
      end
    end 

    role.project_module :formas do |project|
      project.menu :list,   "/backend/formas.js" do |submenu|
        submenu.add :new, "/backend/formas/new"
      end
    end 

    role.project_module :farmacos do |project|
      project.menu :list,   "/backend/farmacos.js" do |submenu|
        submenu.add :new, "/backend/farmacos/new"
      end
    end 

  end
  
  
end