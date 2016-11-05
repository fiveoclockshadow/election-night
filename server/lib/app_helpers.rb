module AppHelpers
  def parse_json_payload
    @body_params = JSON.parse(request.body.read)
  rescue
    request.body.rewind
    raise "JSON could not be parsed: `#{request.body.read}`"
  end

  def json_payload
    @body_params ||= parse_json_payload
   end

  def render_collection(collecton, args = {})
    code = args[:status] || 200
    args[:json_opts] ||= {}
    [code, collecton.to_json]
  end

  def render_one(obj, args = {})
    code = args[:status] || 200
    args[:json_opts] ||= {}
    if obj.valid?
      [code, obj.as_json(args[:json_opts]).to_json]
    else
      [422, { errors: obj.errors.to_h }.to_json]
    end
  end
end
