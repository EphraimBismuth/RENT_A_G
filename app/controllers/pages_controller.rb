class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @goys = Goy.all.limit(4)
    @goys = Goy.all.sample(3)
    @random = Goy.order('RANDOM()').first
  end
end
