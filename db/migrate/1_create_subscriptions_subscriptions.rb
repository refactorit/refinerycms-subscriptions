class CreateSubscriptionsSubscriptions < ActiveRecord::Migration

  def up
    create_table :refinery_subscriptions do |t|
      t.string :email
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-subscriptions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/subscriptions/subscriptions"})
    end

    drop_table :refinery_subscriptions

  end

end
