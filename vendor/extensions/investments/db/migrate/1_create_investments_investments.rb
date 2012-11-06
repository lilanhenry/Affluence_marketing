class CreateInvestmentsInvestments < ActiveRecord::Migration

  def up
    create_table :refinery_investments do |t|
      t.string :title
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-investments"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/investments/investments"})
    end

    drop_table :refinery_investments

  end

end
