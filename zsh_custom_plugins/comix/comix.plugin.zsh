function cbr2cbz() {
  zsh $ZSH/custom/plugins/comix/cbr2cbz.sh $@
}

alias comictagger="comictagger.py"
alias tagcomics="comictagger -s -t cbl -f -o -i"
