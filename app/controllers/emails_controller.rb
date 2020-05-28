class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(
      object: Faker::DcComics.title,
      body: Faker::Lorem.paragraph(sentence_count: 20))
    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
      flash[:notice] = "Email reçu"
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
      flash[:notice] = "Oups ! Erreur..."
    end
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end
end
