# coding: utf-8
require 'spec_helper'

describe AmazonPaApi::Operation do
  include Macros

  describe "AWS credentials" do
    context "have set as class variables via class methods." do
      it "can get response as xml" do
        AmazonPaApi::Operation.access_key_id = ENV['AWS_ACCESS_KEY_ID']
        AmazonPaApi::Operation.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
        AmazonPaApi::Operation.associate_tag = ENV['AWS_ASSOCIATE_TAG']
        
        @item_search = AmazonPaApi::ItemSearch.new("ガンダム","Books")
        expect(@item_search.get.body.include?("Errors")).to eq false

        @similarity_lookup = AmazonPaApi::SimilarityLookup.new('B0026IAWMU')
        expect(@similarity_lookup.get.body.include?("Errors")).to eq false

        @item_lookup = AmazonPaApi::ItemLookup.new('B000UABW5C')
        expect(@item_lookup.get.body.include?("Errors")).to eq false      

        @browse_node_lookup = AmazonPaApi::BrowseNodeLookup.new(71443051)
        expect(@browse_node_lookup.get.body.include?("Errors")).to eq false
      end
    end

    context "is not supplied" do
      it "raise error." do
        @item_lookup = AmazonPaApi::ItemLookup.new('B009KYC6SQ')
        expect{
          @item_lookup.get
        }.to raise_error StandardError
      end
    end


    context "have set as class variables. #credentials=" do
      it "can get response as xml" do
        @item_search = AmazonPaApi::ItemSearch.new("ガンダム","Books")
        @item_search.credentials  = {access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                     secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                     associate_tag: ENV['ASSOCIATE_TAG'],
                                    }
        expect(@item_search.get.body.include?("Errors")).to eq false

        @similarity_lookup = AmazonPaApi::SimilarityLookup.new('B0026IAWMU')
        expect(@similarity_lookup.get.body.include?("Errors")).to eq false

        @item_lookup = AmazonPaApi::ItemLookup.new('B000UABW5C')
        expect(@item_lookup.get.body.include?("Errors")).to eq false      

        @browse_node_lookup = AmazonPaApi::BrowseNodeLookup.new(71443051)
        expect(@browse_node_lookup.get.body.include?("Errors")).to eq false
      end
      
    end
  end

end
