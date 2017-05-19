def upvote_route(item)
  "/#{item.model_name.element}s/#{item.id}/upvote"
end


def downvote_route(item)
  "/#{item.model_name.element}s/#{item.id}/downvote"
end
