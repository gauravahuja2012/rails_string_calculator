require "test_helper"

class CalculatorsControllerTest < ActionDispatch::IntegrationTest
  test 'calculates sum with default delimiters' do
    post calculators_path, params: { input: "1,2,3" }
    assert_response :success
    assert_includes @response.body, "6" 
  end

  test 'calculates sum with custom delimiter' do
    post calculators_path, params: { input: "//;\n1;2" }
    assert_response :success
    assert_includes @response.body, "3"
  end

  test 'calculates sum with newlines' do
    post calculators_path, params: { input: "1\n2,3" }
    assert_response :success
    assert_includes @response.body, "6"
  end

  test 'returns error for negative numbers' do
    post calculators_path, params: { input: "1,-2,3" }
    assert_response :success 
    assert_includes @response.body, "negative numbers not allowed"
  end

  test 'returns 0 for empty input' do
    post calculators_path, params: { input: "" }
    assert_response :success
    assert_includes @response.body, "0"
  end
end