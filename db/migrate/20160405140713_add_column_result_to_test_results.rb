class AddColumnResultToTestResults < ActiveRecord::Migration
  def change
    add_column :test_results, :result, :string
  end
end
