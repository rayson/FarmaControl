class Forma < ActiveRecord::Base
  #Relations
  has_many :farmacos

  #Validations
  validates_presence_of :texto

  def to_s
    sigla || texto
  end
end
