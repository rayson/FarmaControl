class Local < ActiveRecord::Base
  #Relations
  has_many :estoques

  #Validations
  validates_presence_of :nome

  def to_s
    sigla || nome
  end
end
