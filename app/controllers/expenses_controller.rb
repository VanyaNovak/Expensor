class ExpensesController < BaseController
  def index
    @expenses = Expense.filter(params["Category"], current_user.id)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id

    if @expense.save
      redirect_to expenses_path
    else
      flash[:alert] = @expense.errors.first.type

      redirect_to new_expense_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    redirect_to expenses_path
  end

  private

  def expense_params
    params.require(:expense).permit(:description, :price, :category_id)
  end
end
