class AddTrgmIndexToCustomers < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'pg_trgm'
    add_index :customers, [:first_name, :last_name, :email], name: 'trgm_keyword_search_index',
              using: :gin, order: {first_name: :gin_trgm_ops, last_name: :gin_trgm_ops, email: :gin_trgm_ops}
  end
end
