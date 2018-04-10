Types::PostType = GraphQL::ObjectType.define do
  name 'PostType'
  description 'Represents a blog post in the system'

  field :id, !types.ID, 'The ID of the blog post'
  field :title, types.String, 'A user-friendly title for the blog post'
  field :body, types.String, 'The main body of content for the blog post'
  field :user, Types::UserType, 'The user who wrote the blog post'
  field :comments, types[Types::CommentType], 'Comments that have been posted to the blog post'
  field :short_body, types.String, 'Returns the short description of body' do
    resolve ->(obj, args, ctx) {
    obj.body[0, 5]
  }
  end
end