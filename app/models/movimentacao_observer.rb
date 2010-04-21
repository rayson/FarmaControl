class MovimentacaoObserver < ActiveRecord::Observer
  def after_create(movimentacao)
    movimentacao.movimentar
  end

  def before_destroy(movimentacao)
    movimentacao.reverter
  end
end
