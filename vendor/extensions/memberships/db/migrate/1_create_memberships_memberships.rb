class CreateMembershipsMemberships < ActiveRecord::Migration

  def up
    create_table :refinery_memberships do |t|
      t.string :title
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-memberships"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/memberships/memberships"})
    end

    drop_table :refinery_memberships

  end

end
