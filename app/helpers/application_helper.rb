# -*- coding: utf-8 -*-
module ApplicationHelper
  def title_with_entry(url)
    if url == 'frontpage'
      '東工大音ゲーサークルBEATECH'
    else
      'BEATECH'
    end
  end

  def entry_link(title, url)
    title = 'トップページ' if url == 'frontpage'
    if /^http:\/\// =~ url
      link_to(title, url)
    else
      link_to(title, root_url + url)
    end
  end

  def pop_latest_date_entries
    latest_date = @recent_entries.first.updated_at.to_date
    latest_date_entries = Array.new
    rest_entries = Array.new
    @recent_entries.each do |entry|
      if entry.updated_at.to_date == latest_date
        latest_date_entries << entry
      else
        rest_entries << entry
      end
    end
    @recent_entries = rest_entries
    { date: latest_date, entries: latest_date_entries }
  end

  def render_wiki_content(entry)
    render_wiki(entry.content)
  end

  def render_wiki(text)
    @wiki = Beatech::Wiki.new
    @wiki.render(text).html_safe
  end
end
