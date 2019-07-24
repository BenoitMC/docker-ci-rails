export EDITOR="nano"
alias nano="nano -l -e"

function default-env-var() {
  [[ $(eval "echo \$$1") != "" ]] || eval "export $1=\$2"
}

function _title() {
  echo
  echo
  echo
  echo
  echo
  echo "----------   $1   ----------"
  echo
}

export -f _title

# PostgreSQL
default-env-var PGCLIENTENCODING UTF8
default-env-var PGUSER postgres

# Rails
default-env-var RAILS_ENV test
default-env-var POSTGRESQL_USER postgres
default-env-var POSTGRESQL_DB tests
