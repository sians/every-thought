class ApplicationController < ActionController::API

  def json_response(data, include_data: [], meta: {}, params: {}, status: :ok)
    options = {
      include: include_data,
      params: params,
      meta: meta
    }

    render(json: json_serializer(data).new(data, options), status: status)
  end

  private

  def json_serializer(data)
    return EmptySerializer if data.nil?

    data_class_name = data.is_a?(Enumerable) ? data.klass.name : data.class.name

    "#{data_class_name}Serializer".constantize
  end

  def serialize_errors(errors)
    errors.messages
  end

end
