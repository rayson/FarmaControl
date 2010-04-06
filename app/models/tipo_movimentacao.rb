class TipoMovimentacao < ActiveRecord::Base
  #Relations
  belongs_to :origem, :class_name=> "Local"
  belongs_to :destino, :class_name=> "Local"

  #Validations
  validates_presence_of :origem, :if => proc { |obj| obj.destino.nil? }
  validates_presence_of :destino, :if => proc { |obj| obj.origem.nil? }
  validates_presence_of :nome
end
