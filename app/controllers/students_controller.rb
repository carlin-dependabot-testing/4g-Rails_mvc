class StudentsController < ApplicationController
    before_action :set_student,only:%i[show edit update destroy] # this used for each time you neeed to fetch a specific student from db by its id
    #get /students
    def index
        @students =Student.all
    end

    # display specific student details , it uses setStudent method (beforeAction)
    def show
    end


    #create new student instance  of student model purpose is to render form so that user can enter details it  create empty object first
    def new
        @student=Student.new
    end
    
    # this action handle form submission when user submit form the data willl save in db by this sction
    def create
        @student=Student.new(student_params)
        if @student.save
            redirect_to @student,notice:"student was successfully added"
        else
            render :new
        end
    end

    # this action retrieve the specific student to edit using setStudent method and render form with user current data
    def edit
    end
    # this action will actually update student in database
    def update
        if @student.update(student_params)
            redirect_to @student,notice:"Student was successfully updated"
        else
            render :edit
        end
    end

    def destroy
        @student.destroy
        redirect_to students_path,notice:"Student was successfully destroy"
    end

    private
    #fetch student from db when needed and set object to specific actions
    def set_student
        @student=Student.find(params[:id])
    end

     # for restricting access to fields and only allowed data is passed to model
    def student_params
        params.require(:student).permit(:name,:email,:age)
    end

end
