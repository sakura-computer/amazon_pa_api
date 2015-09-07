require 'amazon_pa_api/operations/operation'

module AmazonPaApi
  class BrowseNodeLookup < AmazonPaApi::Operation
    # This is list of Amazon Product Advertising API request parameters.
    REQUEST_PARAMETERS = [
      :browse_node_id,
      :response_group,
    ]

    # BrowseNodeLookup required browse_node_id
    def initialize(browse_node_id, region: :jp)
      super()
      self.browse_node_id = browse_node_id
      self.region = region
      self.operation = "BrowseNodeLookup"
    end
  end
end
