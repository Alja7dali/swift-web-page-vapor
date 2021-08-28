import Swep
import Vapor

extension Document: ResponseEncodable {
  public func encodeResponse(for request: Request) -> EventLoopFuture<Response> {
    var headers = HTTPHeaders()
    headers.add(name: .contentType, value: "text/html; charset=utf-8")

    return request.eventLoop.makeSucceededFuture(
      .init(
        headers: headers,
        body: .init(string: self.render())
      )
    )
  }
}

extension Stylesheet: ResponseEncodable {
  public func encodeResponse(for request: Request) -> EventLoopFuture<Response> {
    var headers = HTTPHeaders()
    headers.add(name: .contentType, value: "text/css; charset=utf-8")

    return request.eventLoop.makeSucceededFuture(
      .init(
        headers: headers,
        body: .init(string: self.render())
      )
    )
  }
}