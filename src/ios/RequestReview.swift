import StoreKit

@objc(RequestReview) class RequestReview : CDVPlugin {
  @objc(requestReview:)
  func requestReview(command: CDVInvokedUrlCommand) {
    var pluginResult = CDVPluginResult(
        status: CDVCommandStatus_ERROR,
        messageAs: [
            "supported": false,
            "reason": "RequestReview not supported on iOS versions below 10.3"
        ]
    )

    /* SKStoreReviewController is iOS 10.3 or newer only. */
    if #available(iOS 10.3, *) {
        SKStoreReviewController.requestReview()
        pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAs: [
                "supported": true,
                "reason": "Great RequestReview is supported"
            ]
        )
    }

    self.commandDelegate!.send(
      pluginResult,
      callbackId: command.callbackId
    )
  }
}
