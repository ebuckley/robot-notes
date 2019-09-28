class RunAutoTaggerAcrossNotes < ActiveRecord::Migration[6.0]
  def change
    Article.all.each do |article|
      TaggingService.new(article).associate_tags
    end
  end
end
