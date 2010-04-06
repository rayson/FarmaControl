class MovimentacaoObserver < ActiveRecord::Observer
  def after_create(movimentacao)
    movimentacao.movimentar
  end
end
