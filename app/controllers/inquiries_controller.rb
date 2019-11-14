class InquiriesController < ApplicationController
  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    @inquiry = Inquiry.new(inquiry_params)

    respond_to do |format|
      if @inquiry.save
        format.html { redirect_to root_path, notice: 'Inquiry was successfully created.' }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      _inquiry_params = params.require(:inquiry).permit(:reply_email, :body)
      _inquiry_params.merge!(user_id: current_user.id) if user_signed_in?
      _inquiry_params
    end
end
