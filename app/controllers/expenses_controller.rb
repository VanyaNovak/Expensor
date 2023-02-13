class ExpensesController < BaseController
  def new
    @expense = Expense.new
  end

  def create
    @expense = current_user.expenses.build(expense_params)

    if @expense.save
      redirect_to list_path(list)
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
      redirect_to list_path(list)
    else
      flash[:alert] = @expense.errors.first.type
      redirect_to edit_expense_path
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    redirect_to list_path(list)
  end

  private

  def expense_params
    params.require(:expense).permit(:description, :price, :category_id)
  end

  def list
    current_user.list
  end
end
