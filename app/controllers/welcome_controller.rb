class WelcomeController < ApplicationController
    # include Devise::TestHelpers
    def index
        @actividades = PublicActivity::Activity.all
    end
end
