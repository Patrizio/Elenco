Fabricator(:department) do
  company
  company_id { Fabricate.sequence }
end
