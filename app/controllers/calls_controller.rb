class CallsController < ApplicationController
  def new
    request.format = :twiml

    respond_to do | format |
      format.twiml
    end
  end
end
