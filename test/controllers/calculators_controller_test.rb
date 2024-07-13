require "test_helper"

class CalculatorsControllerTest < ActionDispatch::IntegrationTest
  test 'calculates sum with default delimiters' do
    post calculators_path, params: { input: "1,2,3" }
    assert_response :success
    assert_includes @response.body, "6"  # Adjust based on your response format
  end

  test 'calculates sum with custom delimiter' do
  end

  test 'calculates sum with newlines' do
  end

  test 'returns error for negative numbers' do
  end

  test 'returns 0 for empty input' do
  end
end