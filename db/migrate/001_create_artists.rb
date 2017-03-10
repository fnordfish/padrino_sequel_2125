Sequel.migration do
  up do
    create_table :artists do
      primary_key :id
      
    end
  end

  down do
    drop_table :artists
  end
end
