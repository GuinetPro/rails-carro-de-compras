class PaymentsController < ApplicationController
    before_action :authenticate_usuario!

    def create
        @payment = current_usuario.payments.new(post_params)
        respond_to do |format|
            if @payment.save
                format.html { redirect_to carrito_path }
                format.json {head :no_content}
            else
                redirect_to Post.find(post_params[:post_id]), error: "No pudimos procesar tu compra"
                format.json {head :no_content}
            end
        end
    end
    def carrito
        @payments = current_usuario.payments.where(estado:1)
    end
    def compras
        @payments = current_usuario.payments.where(estado:2)
    end
    def express
        costo = current_usuario.costo_compra_pendiente
        response = EXPRESS_GATEWAY.setup_purchase(costo * 100,
            ip: request.remote_ip,
            return_url: "http://localhost:3000/transactions/checkout",
            cancel_return_url: "http://localhost:3000/carrito",
            name: "Checkout de compras en EasyDesign",
            amount: costo*100
        )
        redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token, review: false)
    end
    private
    def post_params
        params.require(:payment).permit(:post_id)
    end
end
