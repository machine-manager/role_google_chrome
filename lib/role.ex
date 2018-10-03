defmodule RoleGoogleChrome do
	def role(_tags \\ []) do
		%{
			implied_roles:     [RoleGoogleChromeRepo],
			desired_packages:  ["google-chrome-beta"],
			ferm_output_chain:
				"""
				# Chrome tries to talk UPnP on all interfaces (probably for Chromecast); we don't want to log it
				daddr 239.255.255.250 proto udp dport 1900 REJECT;

				outerface lo {
					# Chrome Developer Tools, when opened, repeatedly tries to
					# connect to this; we don't want to log it.  Implemented in
					# chrome/browser/devtools/device/devtools_android_bridge.cc
					daddr 127.0.0.1 proto tcp syn dport 9229 REJECT;
				}
				""",
		}
	end
end
