if @post.persisted?
  json.insert_item render(partial: "shared/posts", formats: :html, locals: { post: @post, in_reply: false })
else
  json.error @post.errors.full_messages
end
