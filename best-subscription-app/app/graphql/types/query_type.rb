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
      i = 0
      products.each do |product|
        result += "," if i > 0
        result += "{\"id\":#{product.id},\"title\":" + "\"#{product.title}\"}"
        i+=1
      end
      result += "]"
      return result
    end
  end
end
