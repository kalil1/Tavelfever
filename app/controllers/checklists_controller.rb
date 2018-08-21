class ChecklistsController < ApplicationController
  before_action :set_checklist, only: [:show, :edit, :update, :destroy]
  before_action :set_activity, only: [:show, :new, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  # GET /checklists
  # GET /checklists.json
  def index
    @checklists = Checklist.all
    @activities = Activity.all
  end

  # GET /checklists/1
  # GET /checklists/1.json
  def show
    @weather = OpenWeatherApi.new("dae8d10e4ffe898434f2932fc31d48d2").get_weather(current_user.checklists.last.destination)

    @description = @weather['weather'][0]['description']
    @icon = @weather['weather'][0]['icon']
    @temp = @weather['main']['temp']
  end

  # GET /checklists/new
  def new
    @checklist = current_user.checklists.build
  end

  # GET /checklists/1/edit
  def edit
  end

  # POST /checklists
  # POST /checklists.json
  def create
    @checklist = current_user.checklists.build(checklist_params)
    @checklist.user_id = current_user.id


    respond_to do |format|
      if @checklist.save
        format.html { redirect_to user_path(current_user), notice: 'Checklist was successfully created.' }
        format.json { render :show, status: :created, location: @checklist }

        params[:activities].each do |activity_id|
          Item.where(activity_id: activity_id).each do |item|
            @checklist.items << item
          end
        end
      else
        format.html { render :new }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checklists/1
  # PATCH/PUT /checklists/1.json
  def update
    respond_to do |format|
      if @checklist.update(checklist_params)
        format.html { redirect_to @checklist, notice: 'Checklist was successfully updated.' }
        format.json { render :show, status: :ok, location: @checklist }
      else
        format.html { render :edit }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklists/1
  # DELETE /checklists/1.json
  def destroy
    @checklist.destroy
    respond_to do |format|
      format.html { redirect_to checklists_url, notice: 'Checklist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

def set_activity
      @activities = Activity.all
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist
      @checklist = Checklist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checklist_params
      params.require(:checklist).permit(:date, :destination, :length, :list_name, :activities => [])
    end

end
