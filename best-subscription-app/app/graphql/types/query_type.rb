module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :products, String, null: false,
      description: "Get list of products"
    def products
      result = "["
      products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
      products.each do |product|
        result += "{\"id\":#{product.id},\"title\":" + "\"#{product.title}\"}"
      end
      result += "]"
      return result
    end
  end
end
