module VotesHelper

  def vote_link_classes(post, direction)
    if direction == 'up'
      if current_user.voted(post) && current_user.voted(post).up_vote?
        "glyphicon glyphicon-chevron-up voted"
      else
        "glyphicon glyphicon-chevron-up"
      end
    elsif direction == 'down'
      if current_user.voted(post) && current_user.voted(post).down_vote?
        "glyphicon glyphicon-chevron-down voted"
      else
        "glyphicon glyphicon-chevron-down"
      end
    end
  end

end