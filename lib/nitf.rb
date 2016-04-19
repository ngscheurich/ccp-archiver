module Nitf
  class Story
    attr_reader :story
    attr_reader :xml

    def initialize(story)
      @story = story
      @xml = builder.to_xml
    end

    def builder
      Nokogiri::XML::Builder.new do |xml|
        xml.nitf do
          nitf_head(xml)
          nitf_body(xml)
        end
      end
    end

    def nitf_head(xml)
      xml.head do
        xml.docdata { nitf_identified_content(xml) }
        xml.send(:"doc-id", "id-string" => "article-#{@story.cms_id}")
        xml.pubdata(type: "web", "position.section" => @story.section)
        xml.send(:"date.release", norm: @story.nitf_publish_date) if content?(@story.publish_date)
      end
    end

    def nitf_identified_content(xml)
      xml.identified_content do
        nitf_asset_type(xml)
        nitf_location(xml)
        nitf_keywords(xml)
      end
    end

    def nitf_asset_type(xml)
      xml.classifier(type: "tncms:asset", value: "asset")
    end

    def nitf_location(xml)
    end

    def nitf_keywords(xml)
      if content?(@story.keywords)
        xml.key_list do
          @story.keywords.split(", ").each { |k| xml.keyword(key: k) }
        end
      end
    end

    def nitf_body(xml)
      xml.body do
        nitf_body_head(xml)
        nitf_body_content(xml)
      end
    end

    def nitf_body_head(xml)
      xml.send(:"body.head") do
        nitf_hedline(xml)
        nitf_byline(xml)
      end
    end

    def nitf_hedline(xml)
      if content?(@story.headline) || content?(@story.subhead)
        xml.hedline do
          xml.hl1(@story.headline) if content?(@story.headline)
          xml.hl2(class: "subheadline") { @story.subhead } if content?(@story.subhead)
        end
      end
    end

    def nitf_byline(xml)
      xml.byline { xml.cdata(@story.byline) } if content?(@story.byline)
    end

    def nitf_body_content(xml)
      xml.send(:"body.content") do
        nitf_related_links(xml)
        nitf_body_text(xml)
        nitf_infobox(xml)
      end
    end

    def nitf_related_links(xml)
    end

    def nitf_body_text(xml)
      if content?(@story.body)
        xml.block(xmlns: "http://www.w3.org/1999/xhtml") { xml.cdata(@story.body) }
      end
    end

    def nitf_infobox(xml)
      if content?(@story.infobox)
        xml.block(xmlns: "http://www.w3.org/1999/xhtml", class: "breakout") do
          xml.classifier(type: "tncms:related-content-type", value: "infobox")
          xml.cdata(@story.infobox)
        end
      end
    end

    def content?(str)
      !str.nil? && str != ""
    end
  end
end
