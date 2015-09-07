require 'amazon_pa_api/operations/operation'

module AmazonPaApi
  class ItemLookup < AmazonPaApi::Operation

    # This is list of Amazon Product Advertising API request parameters.
    REQUEST_PARAMETERS = [
      :condition,
      :id_type,
      :item_id,
      :merchant_id,
      :offer_page,
      :related_items_page,
      :relationship_type,
      :review_page,
      :review_sort,
      :search_index,
      :tag_page,
      :tags_per_page,
      :tag_sort,
      :variation_page,
      :response_group,
    ]

    # ItemLookup requires ItemId.
    def initialize(item_id, region: :jp)
      super()
      self.item_id = item_id
      self.region = region
      self.operation = "ItemLookup"
    end
  end
end
