# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Investments" do
    describe "Admin" do
      describe "investments" do
        login_refinery_user

        describe "investments list" do
          before do
            FactoryGirl.create(:investment, :title => "UniqueTitleOne")
            FactoryGirl.create(:investment, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.investments_admin_investments_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.investments_admin_investments_path

            click_link "Add New Investment"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Investments::Investment.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Investments::Investment.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:investment, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.investments_admin_investments_path

              click_link "Add New Investment"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Investments::Investment.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:investment, :title => "A title") }

          it "should succeed" do
            visit refinery.investments_admin_investments_path

            within ".actions" do
              click_link "Edit this investment"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:investment, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.investments_admin_investments_path

            click_link "Remove this investment forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Investments::Investment.count.should == 0
          end
        end

      end
    end
  end
end
