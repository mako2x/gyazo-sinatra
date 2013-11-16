module Gyazo
  class Controller < Sinatra::Base

    configure do
      set :dbm_path, 'db/id'
      set :image_dir, 'public'
      set :image_url, 'http://gyazo.send.sh/images'
    end

    post '/' do
      id = request[:id]
      data = request[:imagedata][:tempfile].read
      hash = Digest::MD5.hexdigest(data).to_s
      dbm = SDBM.open(options.dbm_path, 0644)
      dbm[hash] = id
      File.open("#{options.image_dir}/#{hash}.png", 'w'){|f| f.write(data)}

      "#{options.image_url}/#{hash}.png"
    end
  end
end
