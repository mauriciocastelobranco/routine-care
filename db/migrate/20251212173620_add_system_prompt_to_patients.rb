class AddSystemPromptToPatients < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :system_prompt, :text
  end
end
