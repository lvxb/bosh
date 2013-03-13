Sequel.migration do
  up do
    alter_table :release_versions do
      add_column :commit_hash, String
      set_column_default :commit_hash, 'unknown'

      add_column :dirty, TrueClass
      set_column_default :dirty, false
    end
    self[:release_versions].update(commit_hash: 'unknown', dirty: false)
  end

  down do
    alter_table :release_versions do
      drop_column :commit_hash
      drop_column :dirty
    end
  end
end
