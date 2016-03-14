class AddColumnCompleteAndStepToTestResults < ActiveRecord::Migration
  def change
    add_column :test_results, :complete, :boolean, default: false
    add_column :test_results, :step, :string
  end
end
