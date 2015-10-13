class UsuarioController < ApplicationController
    def show
        @usuario = Usuario.find(params[:id])
    end
    def follow
        friend_id = post_params

        respond_to do |format|
            if current_usuario.follow!(post_params[:friend_id])
                format.json {head :no_content}
            else

                format.json {render json: post_params}
            end
        end
    end

    private
    def post_params
        #solo permite que envie un post frind_id
        params.require(:usuario).permit(:friend_id)
    end
end