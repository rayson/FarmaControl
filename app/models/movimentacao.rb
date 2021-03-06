class Movimentacao < ActiveRecord::Base
  #Relations
  belongs_to :estoque
  belongs_to :tipo_movimentacao
  belongs_to :farmaco

  #Validations
  validates_presence_of :tipo_movimentacao

  def movimentar
    estoque_origem= estoque_destino = nil
    Movimentacao.transaction do
      estoque_origem= Estoque.find(:first, :conditions=>{:local_id=> tipo_movimentacao.origem_id, :farmaco_id=>farmaco_id}) unless tipo_movimentacao.origem_id.nil?
      estoque_destino= Estoque.find(:first, :conditions=>{:local_id=> tipo_movimentacao.destino_id, :farmaco_id=>farmaco_id}) unless tipo_movimentacao.destino_id.nil?
      estoque_origem && estoque_origem.saida(quantidade)
      estoque_destino && estoque_destino.entrada(quantidade)
      estoque_origem || estoque_destino
    end
  end

  def reverter
    estoque_origem= estoque_destino = nil
    Movimentacao.transaction do
      estoque_origem= Estoque.find(:first, :conditions=>{:local_id=> tipo_movimentacao.origem_id, :farmaco_id=>farmaco_id}) unless tipo_movimentacao.origem_id.nil?
      estoque_destino= Estoque.find(:first, :conditions=>{:local_id=> tipo_movimentacao.destino_id, :farmaco_id=>farmaco_id}) unless tipo_movimentacao.destino_id.nil?
      estoque_origem && estoque_origem.entrada(quantidade)
      estoque_destino && estoque_destino.saida(quantidade)
      estoque_origem || estoque_destino
    end
  end

end
