module QuizzesHelper
  def timeline(counter)
    if counter.even?
      ""
    else
      "timeline-inverted"
    end
  end
end
