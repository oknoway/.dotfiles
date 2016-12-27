function cbr2cbz() {
  zsh $ZSH/custom/plugins/comix/cbr2cbz.sh $@
}

alias comictagger="comictagger.py"
alias tagcomix="comictagger -s --nooverwrite -t cbl -f -o -i -1 -w"
alias renamecomix="comictagger -r -t cbl"
alias zipcomix="comictagger --export-to-zip --delete-rar"
