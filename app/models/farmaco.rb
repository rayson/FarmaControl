class Farmaco < ActiveRecord::Base

  #Relations
  belongs_to :forma
  has_many :estoques
  has_many :movimentacaos


  #Validations
  validates_presence_of :forma_id, :farmaco
  validates_uniqueness_of :farmaco

  #Callbacks
  after_create :create_estoques
  after_destroy :destroy_estoques

  private
    def create_estoques
      Local.all.collect{|l| Estoque.create(:farmaco_id=> id, :local_id=>l.id)}
    end

    def destroy_estoques(record)
      Estoque.destroy_all(:farmaco_id=> record.id)
    end
end
