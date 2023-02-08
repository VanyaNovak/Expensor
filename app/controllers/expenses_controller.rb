class ExpensesController < BaseController
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:description, :price, :category_id, :user_id)
  end
end
