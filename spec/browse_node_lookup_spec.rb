require 'spec_helper'

describe AmazonPaApi::BrowseNodeLookup do
  include Macros

  subject { @browse_node_lookup }
  before do
    @browse_node_lookup = AmazonPaApi::BrowseNodeLookup.new(71443051)
  end

  describe "operation and request " do
    before do
      check_aws_env
      @browse_node_lookup.credentials = {access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                  associate_tag: ENV['ASSOCIATE_TAG'],
                                 }

    end
    
    describe "PA api request #get" do
      it "can get response as xml" do
        expect(@browse_node_lookup.get.body.include?("Errors")).to eq false
      end
    end
  end
  
end
