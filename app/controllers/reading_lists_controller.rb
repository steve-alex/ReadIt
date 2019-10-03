class ReadingListsController < ApplicationController
  before_action :set_reading_list, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @reading_lists = current_user.reading_lists
    else
      @reading_lists = []
    end
  end

  def show
    @books = @reading_list.books
  end

  def new #not using yet
    @reading_list = ReadingList.new
  end

  def edit #not using yet
  end

  def create
    @reading_list = ReadingList.new(reading_list_params)

    respond_to do |format|
      if @reading_list.save
        format.html { redirect_to @reading_list, notice: 'Reading list was successfully created.' }
        format.json { render :show, status: :created, location: @reading_list }
      else
        format.html { render :new }
        format.json { render json: @reading_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update #not using yet
    respond_to do |format|
      if @reading_list.update(reading_list_params)
        format.html { redirect_to @reading_list, notice: 'Reading list was successfully updated.' }
        format.json { render :show, status: :ok, location: @reading_list }
      else
        format.html { render :edit }
        format.json { render json: @reading_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy #not using yet
    @reading_list.destroy
    respond_to do |format|
      format.html { redirect_to reading_lists_url, notice: 'Reading list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading_list
      @reading_list = ReadingList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_list_params
      params.fetch(:reading_list, {})
    end

end