cp ./models.rs models-temp.sh
rm -rf models/*
find ./models-temp.sh -type f -exec sed -i '' -e 's/pub mod \([a-z]*\); \/\/ \([a-zA-Z ]*\)/mkdir models\/\1\nfor module in \2\ndo\n\techo "pub mod $module;" >> models\/\1.rs\n\ttouch models\/\1\/$module.rs\n\techo "use crate::core::Definition;\n\npub struct $\{(C)module\};\n\nimpl Definition for $\{(C)module\} \{\}" > models\/\1\/$module.rs\ndone/g' {} \;
zsh models-temp.sh
