class AddEmailConstraintToUserAsActiveRecord < ActiveRecord::Migration[5.0]
  def up
    execute '
      ALTER TABLE
        users
      DROP CONSTRAINT
        email_must_be_company_email
    '

    validates :users, :email, format: { with: /^[^@]+@gmail\.com/,
                                        message: 'Email domain must use gmail'}
  end

  def down
    execute %{
      ALTER TABLE
        users
      ADD CONSTRAINT
        email_must_be_company_email
      CHECK ( email ~* '^[^@]+@gmail\\.com' )
    }

    validates :users, :email, format: false
  end
end
