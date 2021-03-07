class SchoolClassesController < ApplicationController 
    before_action :find_school_class, only: [:show, :edit, :update, :destroy]

     def index
       @school_classes = Song.all
     end

    def show
      @school_class = SchoolClass.find(params[:id])
  OR  find_school_class    (FROM PRIVATE METHOD BELOW)
    end
  
    def new
      @school_class = SchoolClass.new
    end
  
    def edit
      @school_class = SchoolClass.find(params[:id])
# He didn’t have anything in it
    end
  
    def create
      @school_class = SchoolClass.new(school_class_params)
      #@school_class.save
      #redirect_to school_class_path(@school_class)
      if @school_class.save
            # redirect_to "/school_class/#{school_class.id}"
            # redirect_to school_class_path(school_class)
            redirect_to @school_class, success: "School Class successfully created!"
        else
            flash.now[:error] = @school_class.errors.full_messages.to_sentence
            render :new
        end
    end
  
    def update
      @school_class = SchoolClass.find(params[:id])
      @school_class.update(school_class_params)
      redirect_to school_class_path(@school_class)
    end

# Matteo version of update

def update
        @school_class.update(school_class_params(:name, :price, :availability, :category))
        if @school_class.valid?
            # redirect_to "/school_class/#{school_class.id}"
            # redirect_to school_class_path(school_class)
            redirect_to @school_class
        else
            render :edit
        end
    end

  def destroy
        if @school_class.destroy
            redirect_to school_class_path
        else
            redirect_to back
        end
