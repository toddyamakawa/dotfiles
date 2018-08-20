
set -x FISH_PATH $HOME/.config/fish

abbr -a fishrc source $FISH_PATH/config.fish

abbr -a -- - cd -

source $FISH_PATH/plugins/arm/setup.fish

