class Client::ButtonsController < ApplicationController
  def index
    response = Unirest.get("localhost:3000/api/buttons")
    @buttons = response.body
    render "index.html.erb"
  end

  def show
    button_id = params[:id]
    response = Unirest.get("localhost:3000/api/buttons/#{button_id}")
    @button = response.body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    # take in the parameters
    # make a web request to the API to create new item
    response = Unirest.post("localhost:3000/api/buttons", parameters:
      {
        input_color: params[:input_color],
        input_shape: params[:input_shape],
        input_description: params[:input_description],
        input_image_url: params[:input_image_url]
      }
    )
    @button = response.body
    flash[:success] = "You added a new button"
    # show the newly created item to the user in HTML
    redirect_to "/client/buttons/#{@button['id']}"
  end

  def edit
    # show the form
    button_id = params[:id]
    response = Unirest.get("localhost:3000/api/buttons/#{button_id}")
    @button = response.body
    render "edit.html.erb"
  end

  def update
    # take in params from the form
    client_params = {
      input_shape: params[:input_shape],
      input_color: params[:input_color],
      input_description: params[:input_description],
      input_image_url: params[:input_image_url]
    }
    # make a unirest request to send the params to the API
    response = Unirest.patch("localhost:3000/api/buttons/#{params[:id]}",parameters: client_params)
    # show the updated item
    @button = response.body
    flash[:success] = "You updated a currently existing button"
    redirect_to "/client/buttons/#{@button['id']}"
  end

  def destroy
    # get the item
    button_id = params[:id]
    # delete the item from the db
    response = Unirest.delete("localhost:3000/api/buttons/#{button_id}")
    flash[:danger] = "You just deleted a button"
    redirect_to "/client/buttons"
  end
end
