module DashboardHelper
  def check_if_present(attendance)    
    attendance.attendance_details.each do |ad|
      if ad.student_id.to_s == session[:id]
        return "Present"
      end
    end
    return "Absent"
  end

  def get_percentage(test)
    score = get_score(test)
    no_items = test.no_of_items
    percentage = (score.to_f / no_items) * 100
    return percentage.to_i.to_s + "%"
    
  end

  def get_score(test)    
    test.test_results.each do |tr|
      if tr.student_id.to_s == session[:id]
        return tr.score
      end
    end
    return 0
  end
end
