class Friendship < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :friend, class_name: "Usuario"
    #la gema de public activity estara pendiente cada vez q se cra un post
  # por su aprte debemos decirle quien fue quien creo el post
  # un proc es una funcion anonima
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller,model| controller.current_usuario }
end
