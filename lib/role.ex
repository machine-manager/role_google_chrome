defmodule RoleGoogleChrome do
	def role(_tags \\ []) do
		%{
			implied_roles:    [RoleGoogleChromeRepo],
			desired_packages: ["google-chrome-stable"],
		}
	end
end
