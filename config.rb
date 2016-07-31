activate :autoprefixer

helpers do
  
  def remark
    Dir.glob('source/remarks/*.remark')[0]
  end

  def remark_link(file)
    filename = File.basename(file, '.remark')
    title = filename.gsub("_", " ").titleize
    url = "/remarks/#{filename}.remark"

    link_to title, url
  end


  def extract_content(name)
    file = File.read(name)
    file.sub(stylesheet_regex, '')
  end


  def extract_stylesheet(name)
    file = File.read(name)
    stylesheet_regex.match(file) { |m| m[1] } || 'default'
  end

  def stylesheet_regex
    /\A!!! (\S*)$/
  end

end


r = remark()
stylesheet = extract_stylesheet(r)

proxy "/index.html", "/template.html", :layout => "index", :locals => { :remark => r, :stylesheet => stylesheet }

set :fonts_dir, 'source/fonts/'
ignore "/template.html"


configure :development do
  activate :livereload
end
