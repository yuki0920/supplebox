module ApplicationHelper
  
  # 日時をスラッシュ区切りで表示するメソッド
  def simple_time(time)
    time.strftime("%Y/%m/%d %H:%M")
  end
  
end
