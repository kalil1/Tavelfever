class UseritemsController < ApplicationController
  before_action :find_checklist
  	before_action :find_useritem, only: [:edit, :update, :destroy]
  	before_action :authenticate_user!, only: [:new, :edit]

  	def new
  		@useritem = Useritem.new
  	end

  	def create
  		@useritem = Useritem.new(useritem_params)
  		@useritem.checklist_id = @checklist.id
  		@useritem.user_id = current_user.id

  		if @useritem.save
  			redirect_to checklist_path(@checklist)
  		else
  			render 'new'
  		end
  	end

  	def edit
  	end

  	def update
  		if @useritem.update(useritem_params)
  			redirect_to checklist_path(@checklist)
  		else
  			render 'edit'
  		end
  	end

  	def destroy
  		@useritem.destroy
  		redirect_to checklist_path(@checklist)
  	end

  	private

  		def useritem_params
  			params.require(:useritem).permit(:name)
  		end

  		def find_checklist
  			@checklist = Checklist.find(params[:checklist_id])
  		end

  		def find_useritem
  			@useritem = Useritem.find(params[:id])
  		end

end
