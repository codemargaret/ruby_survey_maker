require("spec_helper")

describe(Question) do

  describe("#survey") do
    it("tells what survey the questions belong to") do

      test_survey = Survey.create({:title => "Monkey kings"})
      test_question = Question.create({:description => "You like apes or gorillas?", :survey_id => test_survey.id})
      test_question2 = Question.create({:description => "You like big gorillas?", :survey_id => test_survey.id})
      # binding.pry
      expect(test_question2.survey).to(eq(test_survey))&(expect(test_question.survey).to(eq(test_survey)))
    end
  end

end
