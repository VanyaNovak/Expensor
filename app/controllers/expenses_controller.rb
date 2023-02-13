class ExpensesController < BaseController
  def index
    @expenses = Expense.filter(params[:filters], current_user.id)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = current_user.expenses.build(expense_params)

    if @expense.save
      redirect_to expenses_path
    else
      flash[:alert] = @expense.errors.first.type
      redirect_to new_expense_path
    end
  end

  def edit
    @expense = current_user.expenses.find(params[:id])
  end

  def update
    @expense = current_user.expenses.find(params[:id])

    if @expense.update(expense_params)
      redirect_to expenses_path
    else
      flash[:alert] = @expense.errors.first.type
      redirect_to edit_expense_path
    end
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
