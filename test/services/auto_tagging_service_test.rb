require 'test_helper'

class AutoTaggingServiceTest < ActiveSupport::TestCase
    test 'should be able to parse the right tags from markdown' do
        @article = articles(:one)
        tagging_service = TaggingService.new(@article)
        parsed_tags = tagging_service.get_tags
        expected_tags = ["main", "sub point", "tertiary heading", "high importance"]
        assert_same parsed_tags.length, expected_tags.length, 'should have the expected number of tags pased'
        difference = (parsed_tags - expected_tags) & (expected_tags - parsed_tags)
        assert difference.length == 0, "expected #{expected_tags.inspect} but got #{parsed_tags.inspect}"
    end

    test 'should manage related article tags' do
        @article = articles(:one)
        tagging_service = TaggingService.new(@article)
        tagging_service.associate_tags
        assert @article.tags.length == 4, 'should have four related tags'
    end


    test 'should remove tags after edit' do
        @article = articles(:one)
        tagging_service = TaggingService.new(@article)
        tagging_service.associate_tags
        assert @article.tags.length == 4, 'should have initial four related tags'

        @article = articles(:one)
        @article.text = <<-TEXT
# First heading
An important paragraph, to test we are actually reading markdown.
# Second heading
The second heading should also be included in the automatic tags
        TEXT
        tagging_service = TaggingService.new(@article)
        tagging_service.associate_tags
        assert @article.tags.length == 2, "expected 2 tags but have #{@article.tags.length}"
    end
end