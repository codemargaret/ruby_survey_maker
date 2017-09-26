class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |q|
      q.column(:description, :string)

      q.timestamps()
    end
  end #change
end #CreateQuestions
