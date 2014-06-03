module ApplicationHelper
  def company
    @company ||= TheCompanyPresenter.new
  end
end
