class Payment < ActiveRecord::Base
  belongs_to :post
  belongs_to :usuario
  validates :post_id, presence: true
  validates :usuario_id, presence: true
  before_save :valores_por_default

  private
  def valores_por_default
    self.estado ||= 1
  end
end
