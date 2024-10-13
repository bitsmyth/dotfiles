## instructions

```
./setup.rb
./sync.rb
```

show installed zsh commands

```
alias
```

## Guides

### Ruby on Rails

**bin/dev**

```sh
#!/usr/bin/env sh

export RUBY_DEBUG_OPEN="${RUBY_DEBUG_OPEN:-true}"
export RUBY_DEBUG_LAZY="${RUBY_DEBUG_LAZY:-true}"
export RUBY_DEBUG_NONSTOP="${RUBY_DEBUG_NONSTOP:-true}"

# export RUBY_DEBUG_HOST="${RUBY_DEBUG_HOST:-127.0.0.1}"
# export RUBY_DEBUG_PORT="${RUBY_DEBUG_PORT:-33333}"
export RUBY_DEBUG_SOCK_PATH="${RUBY_DEBUG_SOCK_PATH:-/tmp/ruby}"

exec foreman start -f Procfile.dev "$@"
```

**Procfile.dev

```Procfile
web: bundle exec rdbg -c -- bin/rails server -b ${HOST_NAME} -p ${RAILS_PORT}
css: bin/rails tailwindcss:watch
```
