# coding: utf-8
require 'spec_helper'

describe AmazonPaApi::ItemSearch do
  include Macros

  subject { @item_search }

  before do
    @item_search = AmazonPaApi::ItemSearch.new('オカメインコ　ヨウム', "Books")
  end

  describe "operation and request " do
    before do
      check_aws_env
      @item_search.credentials = {access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                  associate_tag: ENV['ASSOCIATE_TAG'],
                                 }
    end
    
    describe "PA api request #get" do
      it "can get response as xml" do
        expect(@item_search.get.body).not_to eq nil
        expect(@item_search.get.body.to_s).not_to eq ''
        expect(@item_search.get.body.include?("Errors")).to eq false
      end
    end
  end

end
