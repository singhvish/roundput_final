require 'test_helper'

class CircularInitiativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @circular_initiative = circular_initiatives(:one)
  end

  test "should get index" do
    get circular_initiatives_url
    assert_response :success
  end

  test "should get new" do
    get new_circular_initiative_url
    assert_response :success
  end

  test "should create circular_initiative" do
    assert_difference('CircularInitiative.count') do
      post circular_initiatives_url, params: { circular_initiative: { City: @circular_initiative.City, Country: @circular_initiative.Country, Initiative_description: @circular_initiative.Initiative_description, Leading_organization: @circular_initiative.Leading_organization, Name_of_the_initiative: @circular_initiative.Name_of_the_initiative, Organization_sector: @circular_initiative.Organization_sector, Organization_type: @circular_initiative.Organization_type, Primary_strategy: @circular_initiative.Primary_strategy, Region: @circular_initiative.Region, Website: @circular_initiative.Website } }
    end

    assert_redirected_to circular_initiative_url(CircularInitiative.last)
  end

  test "should show circular_initiative" do
    get circular_initiative_url(@circular_initiative)
    assert_response :success
  end

  test "should get edit" do
    get edit_circular_initiative_url(@circular_initiative)
    assert_response :success
  end

  test "should update circular_initiative" do
    patch circular_initiative_url(@circular_initiative), params: { circular_initiative: { City: @circular_initiative.City, Country: @circular_initiative.Country, Initiative_description: @circular_initiative.Initiative_description, Leading_organization: @circular_initiative.Leading_organization, Name_of_the_initiative: @circular_initiative.Name_of_the_initiative, Organization_sector: @circular_initiative.Organization_sector, Organization_type: @circular_initiative.Organization_type, Primary_strategy: @circular_initiative.Primary_strategy, Region: @circular_initiative.Region, Website: @circular_initiative.Website } }
    assert_redirected_to circular_initiative_url(@circular_initiative)
  end

  test "should destroy circular_initiative" do
    assert_difference('CircularInitiative.count', -1) do
      delete circular_initiative_url(@circular_initiative)
    end

    assert_redirected_to circular_initiatives_url
  end
end
