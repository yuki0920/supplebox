# frozen_string_literal: true

module ApplicationHelper
  # 日時をスラッシュ区切りで表示するメソッド
  def simple_time(time)
    time.strftime('%Y/%m/%d %H:%M')
  end

  # メタタグを表示するメソッド
  def default_meta_tags
    {
      site: 'サプリボックス',
      title: 'SuppleBox プロテイン口コミ・評判サイト',
      reverse: true,
      charset: 'utf-8',
      description: '実際に購入した方のプロテインの口コミ・評価が閲覧できるサイトです。「プロテイン選びで失敗したくない」方は、当サイトで味や価格をチェックして、自分にあったプロテインを見つけてください。',
      keywords: 'プロテイン,ホエイプロテイン,口コミ,評判,おいしい,選び方,',
      canonical: request.original_url,
      separator: '|',
      # icon: [
      #   { href: image_url('favicon.ico') },
      #   { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      # ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        # image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary',
        site: '@YukiWebTech'
      }
    }
  end

  def breadcrumb_pagination
    if @query_params[:page].nil? || @query_params[:page] == 1
      breadcrumb :products
    else
      breadcrumb :products_pagination, @query_params
    end
  end
end
