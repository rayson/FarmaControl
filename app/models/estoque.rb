class Estoque < ActiveRecord::Base
  #Relations
  belongs_to :farmaco
  belongs_to :local
  has_many :movimentacaos

  #Validations
  validates_presence_of :farmaco_id, :local_id, :quantidade

  #User private functions
#  private
  
    def entrada(valor)
      update_attribute(:quantidade, quantidade+valor)
    end

    def saida(valor)
      update_attribute(:quantidade, quantidade-valor)
    end


end
