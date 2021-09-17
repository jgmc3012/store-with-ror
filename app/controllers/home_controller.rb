class HomeController < ApplicationController
  def grettings
    render json: { greatting: I18n.t(:hello) }
  end
end
