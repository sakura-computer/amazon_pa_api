# coding: utf-8
require 'spec_helper'

describe AmazonPaApi::ItemSearch do
  include Macros

  subject { @item_search }

  before do
    @item_search = AmazonPaApi::ItemSearch.new('ガンダム', "Books")
  end

  describe "operation and request " do
    before do
      check_aws_env
      @item_search.access_key_id = ENV['AWS_ACCESS_KEY_ID']
      @item_search.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      @item_search.associate_tag = ENV['ASSOCIATE_TAG']
    end
    
    describe "PA api request #get" do
      it "can get response as xml" do
        expect(@item_search.get).not_to eq nil
      end
    end
  end

end
