require 'spec_helper'

describe AmazonPaApi::ItemLookup do
  include Macros

  subject { @item_lookup }
  before do
    #    check_aws_env
    @item_lookup = AmazonPaApi::ItemLookup.new('B000UABW5C')
  end

  describe "instance methods must respond to" do
    it { should respond_to(:condition) }
    it { should respond_to(:id_type) }
    it { should respond_to(:item_id) }
    it { should respond_to(:merchant_id) }
    it { should respond_to(:offer_page) }
    it { should respond_to(:related_items_page) }
    it { should respond_to(:relationship_type) }
    it { should respond_to(:review_sort) }
    it { should respond_to(:search_index) }
    it { should respond_to(:tag_page) }
    it { should respond_to(:tags_per_page) }
    it { should respond_to(:tag_sort) }
    it { should respond_to(:variation_page) }
    it { should respond_to(:response_group) }

    describe "default value at initialized" do
      context "item_id" do
        it "is supplied from arguments" do
          expect(@item_lookup.item_id).to eq 'B000UABW5C'
        end
      end

      context "region" do
        it "is supplied as 'jp'" do
          expect(@item_lookup.region).to eq :jp
        end
      end
    end
  end

  describe "operation and request " do
    before do
      check_aws_env
      @item_lookup.credentials = { access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                   secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                   associate_tag: ENV['ASSOCIATE_TAG'],
                                 }
    end
    
    describe "PA api operation parameter" do

      context "instance variable is supplied" do
        it "is set as query parameter." do
          AmazonPaApi::ItemLookup::REQUEST_PARAMETERS.each do |p|
            @item_lookup.send("#{p}=", "some_#{p}")
            expect(@item_lookup.send(:params).include?(p.to_s.camel_case)).to eq true
            expect(@item_lookup.send(:params)[p.to_s.camel_case]).to eq "some_#{p}"
          end
        end      
      end
    end

    describe "PA api request parameter" do
      context "Service" do
        it "is set as query parameter" do
          expect(@item_lookup.send(:request_params).include?("Service")).to eq true
          expect(@item_lookup.send(:request_params)["Service"]).to eq "AWSECommerceService"
        end
      end

      context "Timestamp" do
        it "is set as query parameter" do
          expect(@item_lookup.send(:request_params).include?("Timestamp")).to eq true
        end
      end

      context "AWSAccessKeyId" do
        it "is set as query parameter" do
          expect(@item_lookup.send(:request_params).include?("AWSAccessKeyId")).to eq true
          expect(@item_lookup.send(:request_params)["AWSAccessKeyId"]).to eq AmazonPaApi::ItemLookup.access_key_id
        end
      end

      context "Operation" do
        it "is set as query parameter" do
          expect(@item_lookup.send(:request_params).include?("Operation")).to eq true
          expect(@item_lookup.send(:request_params)["Operation"]).to eq "ItemLookup"
        end
      end

      context "AssociateTag" do
        it "is set as query parameter" do
          expect(@item_lookup.send(:request_params).include?("AssociateTag")).to eq true
          expect(@item_lookup.send(:request_params)["AssociateTag"]).to eq AmazonPaApi::Operation.associate_tag
        end
      end

      context "Version" do
        it "is set as query parameter" do
          expect(@item_lookup.send(:request_params).include?("Version")).to eq true
          expect(@item_lookup.send(:request_params)["Version"]).to eq AmazonPaApi::ItemLookup::API_VERSION
        end
      end

    end

    describe "PA api request #get" do

      context "IdType: ASIN" do
        it "can get response as xml" do
          @item_lookup.id_type = "ASIN"
          expect(@item_lookup.get.body.include?("Errors")).to eq false
        end
      end

      context "IdType: EAN" do
        it "can get response as xml" do
          @item_lookup = AmazonPaApi::ItemLookup.new('9784634034204')
          check_aws_env
          @item_lookup.credentials = {access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                      associate_tag: ENV['ASSOCIATE_TAG'],
                                     }

          @item_lookup.id_type = "EAN"
          @item_lookup.search_index = "Books"
          expect(@item_lookup.get.body.include?("Errors")).to eq false
        end
      end
    end

    describe "#body" do
      it "can show response body" do
        expect(@item_lookup.get.body.include?("Errors")).to eq false
      end
    end
    
  end

  describe "#credential= " do
    before do
      check_aws_env
      @item_lookup = AmazonPaApi::ItemLookup.new('B009KYC6SQ')
      @item_lookup.credentials = {access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                  associate_tag: ENV['ASSOCIATE_TAG'],
                                 }
    end

    describe "#get" do
      it "can get response as xml" do
        @item_lookup.id_type = "ASIN"
        expect(@item_lookup.get).not_to eq nil
      end
    end

  end

  describe "#region" do
    before do
      @item_lookup = AmazonPaApi::ItemLookup.new('B009KYC6SQ')      
      check_aws_env
      @item_lookup.credentials = { access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                   secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                   associate_tag: ENV['ASSOCIATE_TAG'],
                                 }
    end
    
    context "is invalid" do
      it "raise error." do
        @item_lookup.region = :hoge
        expect{
          @item_lookup.get
        }.to raise_error StandardError
      end
    end

    context "is valid" do
      it "can get response as xml" do
        @item_lookup = AmazonPaApi::ItemLookup.new('B00NLDYGDK', region: :uk)
        check_aws_env
        
        @item_lookup.region = :uk
        expect(@item_lookup.get.body.include?("Errors")).to eq false      
      end
    end
      
  end

end
