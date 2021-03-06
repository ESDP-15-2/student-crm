class PeriodsController < ApplicationController
	before_action :set_period, only: [:show, :edit, :update, :destroy]

	add_breadcrumb '<i class="fa fa-home"></i> Главная'.html_safe, :authenticated_root_url

	def show
	end

	def new
		@period = Period.new
	end

	def edit
	end

	def create
		@period = Period.new(period_params)
    count_lessons(@period)
    @period.cw_status = true if @period.event_type == 'Контрольная'
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

  def count_lessons(period)
    i = 1
    case period.event_type
      when 'Лекция'
        Period.where(event_type: 'Лекция').each do |lesson|
          i += 1
        end
      when 'Вебинар'
        Period.where(event_type: 'Вебинар').each do |lesson|
          i += 1
        end
      when 'контрольная'
        Period.where(event_type: 'Контрольная').each do |lesson|
          i += 1
        end
      when 'контрольная'
        Period.where(event_type: 'Лабораторная').each do |lesson|
          i += 1
        end
      else
        return period
    end
    period.update(lesson_number: i)
  end

	def period_params
		params.require(:period).permit(:course_element_id, :title, :commence_datetime,
                                   :group_id, :course_id, :hw_status, :hw_deadline, :event_type)
	end

end
