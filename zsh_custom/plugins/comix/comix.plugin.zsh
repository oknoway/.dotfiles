function cbr2cbz() {
  zsh $ZSH_CUSTOM/plugins/comix/cbr2cbz.sh $@
}

function rezip() {
  zsh $ZSH_CUSTOM/plugins/comix/rezip.sh $@
}

alias comictagger="comictagger.py"

function checktags() {
  TAGS="$(comictagger -p -t cbl $@)"

  if [ "${TAGS}" == '' ] ; then
    #echo "No tags on $@";
    return 1
  else
    #echo "Tags on $@";
    return 0
  fi
}

function tagcomix() {

  HASTAGS="$(checktags $@)"
  if ${HASTAGS} ; then
    $(tag -a "Comic Tags" $@)
    return
  fi

  $(comictagger -s --nooverwrite -t cbl -f -o -i -1 -w $@)

  HASTAGS="$(checktags $@)"

  if ${HASTAGS} ; then
    $(tag -a "Comic Tags" $@)
    $(tag -r "No Comic Tags" $@)
  else
    $(tag -a "No Comic Tags" $@)
    $(tag -r "Comic Tags" $@)
  fi
}

#alias tagcomix="comictagger -s --nooverwrite -t cbl -f -o -i -1 -w"
alias renamecomix="comictagger -r -t cbl"
alias zipcomix="comictagger --export-to-zip --delete-rar"
