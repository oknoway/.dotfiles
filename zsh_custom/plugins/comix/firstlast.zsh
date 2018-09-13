#!/bin/bash

#first
#first="zipinfo -1 $ARCHIVE | head -n 1"
#unzip -p $ARCHIVE $first | imgcat
#zip -d $ARCHIVE $first

#last
#last="zipinfo -1 $ARCHIVE | sort -r | head -n 1"
#unzip -p $ARCHIVE $last | imgcat
#zip -d $ARCHIVE $last

# tmux requires unrecognized OSC sequences to be wrapped with DCS tmux;
# <sequence> ST, and for all ESCs in <sequence> to be replaced with ESC ESC. It
# only accepts ESC backslash for ST. We use TERM instead of TMUX because TERM
# gets passed through ssh.
function print_osc() {
    if [[ $TERM == screen* ]] ; then
        printf "\033Ptmux;\033\033]"
    else
        printf "\033]"
    fi
}

# More of the tmux workaround described above.
function print_st() {
    if [[ $TERM == screen* ]] ; then
        printf "\a\033\\"
    else
        printf "\a"
    fi
}


# print_image filename inline base64contents print_filename
#   filename: Filename to convey to client
#   inline: 0 or 1
#   base64contents: Base64-encoded contents
#   print_filename: If non-empty, print the filename
#                   before outputting the image
function print_image() {
    print_osc
    printf '1337;File='
    if [[ -n "$1" ]]; then
      printf 'name='`printf "%s" "$1" | base64`";"
    fi

    VERSION=$(base64 --version 2>&1)
    if [[ "$VERSION" =~ fourmilab ]]; then
      BASE64ARG=-d
    elif [[ "$VERSION" =~ GNU ]]; then
      BASE64ARG=-di
    else
      BASE64ARG=-D
    fi

    printf "%s" "$3" | base64 $BASE64ARG | wc -c | awk '{printf "size=%d",$1}'
    printf ";inline=$2"
    printf ":"
    printf "%s" "$3"
    print_st
    printf '\n'
    if [[ -n "$4" ]]; then
      echo $1
    fi
}

# prompt_delete archive Filename
function prompt_delete() {
  read -p 'Delete '`"$2"`' from '`"$1"`' (y/N)? ' confirm
  case ${confirm:0:1} in
    y|Y|yes|Yes )
      echo Confirmed
    ;;
    * )
      echo Unconfirmed
    ;;
  esac
}


function error() {
    echo "ERROR: $*" 1>&2
}

function show_help() {
	echo "Show and/or delete the first or last item in a zip archive.";
    echo "Usage: fl [-fld] filename ..." 1>& 2
}

function check_dependency() {
  if ! (builtin command -V "$1" > /dev/null 2>& 1); then
    echo "firstlast: missing dependency: can't find $1" 1>& 2
    exit 1
  fi
}


## Main

# Show help if no arguments and no stdin.
if [ $# -eq 0 ]; then
    show_help
    exit
fi

check_dependency zipinfo
check_dependency unzip
# check_dependency imgcat

# Look for command line flags.
while [ $# -gt 0 ]; do
    case "$1" in
    -h|--h|--help)
        show_help
        exit
        ;;
    -p|--p|--print)
        print_filename=1
        ;;
    -f|--f|--first)
      # first
      first=true
      ;;
    -l|--l|--last)
      # last
      last=true
      ;;
    -d|--d|--delete)
      # delete
      delete=true
      ;;
    -u|--u|--url)
        check_dependency curl
        encoded_image=$(curl -s "$2" | base64) || (error "No such file or url $2"; exit 2)
        has_stdin=f
        print_image "$2" 1 "$encoded_image" "$print_filename"
        set -- ${@:1:1} "-u" ${@:3}
        if [ "$#" -eq 2 ]; then
            exit
        fi
        ;;
    -*)
        error "Unknown option flag: $1"
        show_help
        exit 1
      ;;
    *)
        if [ -r "$1" ] ; then

          firstFile=$(zipinfo -1 "$1" | head -n 1)
          lastFile=$(zipinfo -1 "$1" | sort -r | head -n 1)

          printf 'First page of '`printf "%s" "$1" `";"
          printf '\n'
          print_image "$1" 1 "$(unzip -p "$1" "$firstFile" | base64)" ""
          printf '\n'

          prompt_delete $1 $firstFile

          #printf 'Last page of '`printf "%s" "$1" `";"
          #unzip -p "$1" "$last" | imgcat


          #first="zipinfo -1 $ARCHIVE | head -n 1"
          #unzip -p $ARCHIVE $first | imgcat
          #zip -d $ARCHIVE $first

          #last
          #last="zipinfo -1 $ARCHIVE | sort -r | head -n 1"
          #unzip -p $ARCHIVE $last | imgcat
          #zip -d $ARCHIVE $last


            #print_image "$1" 1 "$(base64 < "$1")" "$print_filename"
        fi
        ;;
    esac
    shift
done

exit 0
