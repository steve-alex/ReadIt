class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update]

  def new
    @review = Review.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(@review.book.id)
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @book = Book.find(review_params[:book_id])

    respond_to do |format|
      if @review.save
        format.html { redirect_to @book, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @book = Book.find(@review.book.id) 
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @book, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @book = @review.book
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @book, notice: 'Review was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit!
    end
end
