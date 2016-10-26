require 'open-uri'

class Mashable < ServiceBase
  attr_accessor :mashable_rss

  def initialize
    @mashable_rss = "http://mashable.france24.com/tag/start/rss"
  end

  def run
    parsing_mashable(@mashable_rss)
  end

  private

  def parsing_mashable(mashable_rss_url)
    xml_file = open(mashable_rss_url)
    xml_doc = Nokogiri::XML(xml_file)

    xml_doc.search('item').each do |article|

      # Journalist Parsing
      full_name = article.xpath('dc:creator').text
      full_name.split(" ")

     journalist_data = {
        first_name: full_name.split(" ")[0],
        last_name: full_name.split(" ")[1].downcase.capitalize!,
        company: "Mashable France"
      }
      journalist = Journalist.where(journalist_data).first_or_create

      # Keyword Parsing
      article.xpath('category').each do |k|
        keyword = Keyword.where(name: k.text).first_or_create
        journalist.keywords << keyword
      end

      # Article Parsing
      article_data = {
        title: article.xpath('title').text,
        link: article.xpath('link').text,
        writed_at: article.xpath('pubDate').text,
        journalist: journalist
      }

      article = Article.find_or_create_by(article_data)


    end

  end
end
