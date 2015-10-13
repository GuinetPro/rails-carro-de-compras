class OmniauthCallbacksController < ApplicationController

    def facebook
        auth = request.env["omniauth.auth"]
        #raise request.env["omniauth.auth"].to_yaml

        data = {
            nombre: auth.info.first_name,
            apellido: auth.info.last_name,
            username: auth.info.email,#auth.info.nickname,
            email: auth.info.email,
            provider: auth.provider,
            uid: auth.uid
        }

        @usuario = Usuario.find_or_create_by_omniauth(data)

        if @usuario.persisted? #meotodo devuelve verdadero si ya esta registrado
            sign_in_and_redirect @usuario, event: :authentication
        else
            session[:omniauth_errors] = @usuario.errors.full_messages.to_sentence unless @usuario.save #sentences mustra todos los mensajes

            session[:omniauth_data] = data

            redirect_to new_usuario_registration_url
        end

    end

    def twitter
        auth = request.env["omniauth.auth"]

        data = {
            nombre: auth.info.name,
            apellid: "",
            username: auth.info.nickname,
            email: "",
            provider: auth.provider,
            uid: auth.uid
        }

        @usuario = Usuario.find_or_create_by_omniauth(data)

        if @usuario.persisted?
            sign_in_and_redirect @usuario, event: :authentication
        else
            session[:omniauth_errors] = @usuario.errors.full_messages.to_sentence unless @usuario.save

            session[:omniauth_data] = data

            redirect_to new_usuario_registration_url
        end
    end
end
