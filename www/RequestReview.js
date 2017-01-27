var exec = require('cordova/exec');

exports.try = function(success, error) {
    exec(success, error, "RequestReview", "requestReview");
};
