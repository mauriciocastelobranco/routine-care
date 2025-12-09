class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :auth ]

  def home
  end

  def auth
  end
end
