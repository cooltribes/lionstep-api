module RequestsHelper

  def json
    @json ||= JSON.parse(response.body)
  end

  def json_attribute(attribute)
    json["data"]["attributes"][attribute]
  end

  def json_links
    json["links"]
  end

  def json_meta
    json["meta"]
  end

  def request_headers_for(user)
    post "/auth/sign_in", { email: user.email, password: user.password }
    headers = response.headers
    {
      "Accept"        => "application/vnd.lionstep.com; version=1",
      "access-token"  =>  headers["access-token"],
      "client"        =>  headers["client"],
      "expiry"        =>  headers["expiry"],
      "token-type"    =>  headers["token-type"],
      "uid"           =>  headers["uid"]
    }
  end

  def request_admin_headers_for(admin)
    post "/auth_admin/sign_in", { email: admin.email, password: admin.password }
    headers = response.headers
    {
      "Accept"        => "application/vnd.lionstep.com; version=1",
      "access-token"  =>  headers["access-token"],
      "client"        =>  headers["client"],
      "expiry"        =>  headers["expiry"],
      "token-type"    =>  headers["token-type"],
      "uid"           =>  headers["uid"]
    }
  end


end