class MessagesController < ApplicationController
  def index
    limit = params[:limit] || 10
    offset = params[:offset] || 0
    render :json => Message.limit(limit).offset(offset)
  end

  def create
    values = []
    params[:messages].first(60).each do |m|
      values << Message.new(msg: m[:msg], number: m[:number], name: m[:name])
    end
    Message.import values

    render status: 200
  end
end
