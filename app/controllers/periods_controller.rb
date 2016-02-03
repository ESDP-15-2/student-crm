class PeriodsController < ApplicationController
	before_action :set_period, only: [:show, :edit, :update, :destroy]

	def show
	end

	def new
		@period = Period.new
	end

	def edit
	end

	def create
		@period = Period.new(period_params)

		respond_to do |format|
			if @period.save
				format.html { redirect_to calendar_path, notice: 'Event was successfully created.' }
				format.json { render :show, status: :created, location: @period }
			else
				format.html { render :new }
				format.json { render json: @period.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|

			if @period.update(period_params)
				format.html { redirect_to @period, notice: 'Event was successfully updated.' }
				format.json { render :show, status: :ok, location: @period }
			else
				format.html { render :edit }
				format.json { render json: @period.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@period.destroy
		respond_to do |format|
			format.html { redirect_to periods_url, notice: 'Event was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def calendar
		@periods = Period.all
		@period = Period.new
		add_breadcrumb 'Календарь'
	end

	def get_subjects_by_course_id
		@course_elements = CourseElement.where(:course_id => params[:course_id])
		render :json => @course_elements.to_json(:only => [:id, :theme])
	end


	private

	def set_period
		@period = Period.find(params[:id])
	end

	def period_params
		params.require(:period).permit(:course_elements_id, :title, :commence_datetime, :group_id, :course_id)
	end

end
