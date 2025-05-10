class ToDosController < ApplicationController
  before_action :require_login
  before_action :set_to_do, only: %i[ show edit update destroy complete ]

  # GET /to_dos or /to_dos.json
  def index
    @to_dos = current_user.to_dos.order(completed: :asc, priority: :desc, created_at: :desc)
  end

  # GET /to_dos/1 or /to_dos/1.json
  def show
  end

  # GET /to_dos/new
  def new
    @to_do = current_user.to_dos.build
    set_user_options
  end

  # GET /to_dos/1/edit
  def edit
    set_user_options
  end

  # POST /to_dos or /to_dos.json
  def create
    @to_do = current_user.to_dos.build(to_do_params)
    set_user_options

    respond_to do |format|
      if @to_do.save
        format.html { redirect_to @to_do, notice: "To do was successfully created." }
        format.json { render :show, status: :created, location: @to_do }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_dos/1 or /to_dos/1.json
  def update
    set_user_options
    respond_to do |format|
      if @to_do.update(to_do_params)
        format.html { redirect_to @to_do, notice: "To do was successfully updated." }
        format.json { render :show, status: :ok, location: @to_do }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_dos/1 or /to_dos/1.json
  def destroy
    @to_do.destroy!

    respond_to do |format|
      format.html { redirect_to to_dos_path, status: :see_other, notice: "To do was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def completed
    @completed_todos = current_user.to_dos.where(completed: true)
  end

  def complete
    @to_do.update(completed: true)
    redirect_to @to_do, notice: "ToDo marked as completed!"
  end

  private

    # Limit category options to only those belonging to current_user
    def set_user_options
      @select_options = [["Select Category", nil]] +
        current_user.categories.map { |category| [category.name, category.id] }
    end

    # Secure the lookup of the to_do by scoping to current_user
    def set_to_do
      @to_do = current_user.to_dos.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def to_do_params
      params.require(:to_do).permit(:title, :category_id, :completed, :priority)
    end
end
