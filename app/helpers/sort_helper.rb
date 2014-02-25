module SortHelper
  def swap_direction
    params[:sort_direction] == 'ASC' ? 'DESC' : 'ASC'
  end
end