require 'spec_helper'

describe AmazonPaApi::SimilarityLookup do
  include Macros

  subject { @similarity_lookup }
  before do
    @similarity_lookup = AmazonPaApi::SimilarityLookup.new('B0026IAWMU')
  end

  describe "operation and request " do
    before do
      check_aws_env
      @similarity_lookup.credentials = {access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                  associate_tag: ENV['ASSOCIATE_TAG'],
                                 }

    end
    
    describe "PA api request #get" do
      it "can get response as xml" do
        expect(@similarity_lookup.get.body.include?("Errors")).to eq false
      end
    end
  end
  
end
