module("luci.controller.smstools", package.seeall)
function index()
    entry({"admin", "services", "短信"}, cbi("smstools"), _("短信"), 58)
end
