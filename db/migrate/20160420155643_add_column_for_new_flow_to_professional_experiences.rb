class AddColumnForNewFlowToProfessionalExperiences < ActiveRecord::Migration
  def change
    add_reference :professional_experiences, :responsibility_level, index: true
    add_column :professional_experiences, :organization_size, :string
    add_column :professional_experiences, :is_startup, :boolean, default: true
  end
end
