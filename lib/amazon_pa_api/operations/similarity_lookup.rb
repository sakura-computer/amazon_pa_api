require 'amazon_pa_api/operations/operation'

module AmazonPaApi
  class SimilarityLookup < AmazonPaApi::Operation

    # This is list of Amazon Product Advertising API request parameters.
    REQUEST_PARAMETERS = [
      :condition,
      :item_id,
      :merchant_id,
      :similarity_type,
      :response_group,
    ]

    def initialize(item_id, region: :jp)
      super()
      self.item_id = item_id
      self.region = region
      self.operation = "SimilarityLookup"
    end
      
  end
end
