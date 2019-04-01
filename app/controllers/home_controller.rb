class HomeController < ApplicationController
  def index
    @todo_lists = TodoList.all
  end
end
