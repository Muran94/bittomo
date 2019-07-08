class ImprovementRequestsController < ApplicationController
  before_action :set_improvement_request, only: [:show, :edit, :update, :destroy]

  # GET /improvement_requests
  # GET /improvement_requests.json
  # def index
  #   @improvement_requests = ImprovementRequest.all
  # end

  # GET /improvement_requests/1
  # GET /improvement_requests/1.json
  # def show
  # end

  # GET /improvement_requests/new
  def new
    @improvement_request = ImprovementRequest.new
  end

  # POST /improvement_requests
  # POST /improvement_requests.json
  def create
    @improvement_request = ImprovementRequest.new(improvement_request_params)

    respond_to do |format|
      if @improvement_request.save
        format.html { redirect_to root_path, notice: 'Improvement request was successfully created.' }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @improvement_request.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_improvement_request
      @improvement_request = ImprovementRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def improvement_request_params
      _improvement_request_params = params.require(:improvement_request).permit(:request_type, :body)
      _improvement_request_params.merge!(user_id: current_user.id) if user_signed_in?
      _improvement_request_params
    end
end
