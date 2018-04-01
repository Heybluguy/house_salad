class SearchController < ApplicationController
  def index
    state = params[:state]

    @members = Member.find_all(params[:state])

  end


end

