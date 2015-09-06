require 'spec_helper'

describe String, type: :class  do

  describe "#camel_case" do
    describe "converts strings from snake_case to CamelCase." do
      context "from snake_case strings" do
        it "converts to CamelCase." do
          expect("snake_case_string".camel_case).to eq "SnakeCaseString"
        end
      end

      context "from CamelCase strings" do
        it "does nothing." do
          expect("CamelCaseString".camel_case).to eq "CamelCaseString"
        end
      end

      context "strings contain '/'" do
        it "converts '/' to '::'." do
          expect("hoge/snake_case_string".camel_case).to eq "Hoge::SnakeCaseString"
        end

        context "strings contain multiple '/'" do
          it "converts '/' to '::'." do
            expect("foo/bar/snake_case_string".camel_case).to eq "Foo::Bar::SnakeCaseString"
          end
        end
      end
      
    end
    
  end

  describe "#snake_case" do
    describe "converts strings from CamelCase to snake_case." do
      context "from CamelCase strings " do
        it "converts to snake_case" do
          expect("CamelCaseString".snake_case).to eq "camel_case_string"
        end
      end

      context "from snake_case strings " do
        it "does nothing." do
          expect("snake_case_string".snake_case).to eq "snake_case_string"
        end
      end

      context "strings contain '::'" do
        it "converts '::' to '/'" do
          expect("Hoge::CamelCaseString".snake_case).to eq "hoge/camel_case_string"
        end
        
        context "strings contain multiple '::'" do
          it "converts '::' to '/'" do
            expect("Foo::Bar::SnakeCaseString".snake_case).to eq "foo/bar/snake_case_string"
          end
        end
      end
    end
    
  end

end
  

