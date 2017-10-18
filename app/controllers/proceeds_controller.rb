class ProceedsController < ApplicationController
  before_action :set_proceed, only: [:show, :edit, :update, :destroy]

  # GET /proceeds
  # GET /proceeds.json
  def index
    @proceeds = Proceed.all
  end

  # GET /proceeds/1
  # GET /proceeds/1.json
  def show
  end

  # GET /proceeds/new
  def new
    @proceed = Proceed.new
  end

  # GET /proceeds/1/edit
  def edit
  end

  # POST /proceeds
  # POST /proceeds.json
  def create
    @proceed = Proceed.new(proceed_params)

    respond_to do |format|
      if @proceed.save
        format.html { redirect_to @proceed, notice: 'Proceed was successfully created.' }
        format.json { render :show, status: :created, location: @proceed }
      else
        format.html { render :new }
        format.json { render json: @proceed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proceeds/1
  # PATCH/PUT /proceeds/1.json
  def update
    respond_to do |format|
      if @proceed.update(proceed_params)
        format.html { redirect_to @proceed, notice: 'Proceed was successfully updated.' }
        format.json { render :show, status: :ok, location: @proceed }
      else
        format.html { render :edit }
        format.json { render json: @proceed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proceeds/1
  # DELETE /proceeds/1.json
  def destroy
    @proceed.destroy
    respond_to do |format|
      format.html { redirect_to proceeds_url, notice: 'Proceed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceed
      @proceed = Proceed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proceed_params
      params.require(:proceed).permit(:provider_id, :amount)
    end
end
