# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Memberships" do
    describe "Admin" do
      describe "memberships" do
        login_refinery_user

        describe "memberships list" do
          before do
            FactoryGirl.create(:membership, :title => "UniqueTitleOne")
            FactoryGirl.create(:membership, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.memberships_admin_memberships_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.memberships_admin_memberships_path

            click_link "Add New Membership"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Memberships::Membership.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Memberships::Membership.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:membership, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.memberships_admin_memberships_path

              click_link "Add New Membership"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Memberships::Membership.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:membership, :title => "A title") }

          it "should succeed" do
            visit refinery.memberships_admin_memberships_path

            within ".actions" do
              click_link "Edit this membership"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:membership, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.memberships_admin_memberships_path

            click_link "Remove this membership forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Memberships::Membership.count.should == 0
          end
        end

      end
    end
  end
end
