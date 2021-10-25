module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      @result = "["
      @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
      @products.each do |product|
        @result += "{\"title\":" + "\"#{product.title}\"}"
      end
      @result += "]"
      return @result
    end
  end
end
