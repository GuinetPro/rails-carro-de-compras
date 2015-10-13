class Post < ActiveRecord::Base
  belongs_to :usuario,  dependent: :destroy
  has_many :attachments
  has_many :payments
  validates :titulo, presence: true, uniqueness: true
  before_save :valores_por_default

  after_create {|post| post.message 'create'}


  include Picturable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller,model| controller.current_usuario }

  def valores_por_default
    self.costo ||= 0
  end

  def usuarios_ha_pagado? usuario_id
    self.payments.where(estado: 2).size > 0
  end

  def message action
    msg = {
      resource: 'posts',
      action: action,
      id: self.id,
      obj: self,
      username: self.usuario.username.capitalize,
      user_id: self.usuario.id
    }

    $redis.publish 'rt-change', msg.to_json
  end
end
