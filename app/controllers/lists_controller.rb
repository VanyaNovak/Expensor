class ListsController < BaseController
  def show
    @list = List.find(params[:id])
    @expenses = Expense.filter(params[:filters], @list.id)
  end
end
