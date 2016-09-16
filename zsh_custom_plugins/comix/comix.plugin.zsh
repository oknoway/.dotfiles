function cbr2cbz() {
  zsh $ZSH/custom/plugins/comix/cbr2cbz.sh $@
}

alias comictagger="comictagger.py"
alias tagcomix="comictagger -s -t cbl -f -o -i"
alias renamecomix="comictagger -r -t cbl"
alias zipcomix="comictagger --export-to-zip --delete-rar"
