module Voteable

  def total_vote_value
    votes.reduce(0){ |total, vote| total + vote.value }
  end

end
