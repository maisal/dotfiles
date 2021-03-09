if status --is-interactive

if ! type -q fisher and type -q curl
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
	fisher update
end

end
