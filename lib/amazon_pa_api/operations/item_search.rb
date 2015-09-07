require 'amazon_pa_api/operations/operation'

module AmazonPaApi
  class ItemSearch < AmazonPaApi::Operation

    # This is list of Amazon Product Advertising API request parameters.
    REQUEST_PARAMETERS = [
      :actor,
      :artist, 
      :audience_rating,
      :author, 
      :availability,
      :brand, 
      :browse_node,
      :city,
      :composer, 
      :condition,
      :conductor, 
      :director,
      :item_page,
      :keywords,
      :manufacturer,
      :maximum_price,
      :merchant_id,
      :minimum_price,
      :neighborhood,
      :orchestra,
      :postal_code,
      :power, 
      :publisher,
      :related_items_page,
      :relationship_type,
      :review_sort,
      :search_index,
      :sort, 
      :tag_page,
      :tags_per_page,
      :tag_sort, 
      :text_stream,
      :title,
      :variation_page,
      :response_group
    ]

    # ItemSearch requires keywords and search index.
    def initialize(keywords, search_index, region: :jp)
      super()
      self.keywords = keywords
      self.search_index = search_index
      self.region = region
      self.operation = "ItemSearch"
    end
  end
end
