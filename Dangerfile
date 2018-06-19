# frozen_string_literal: true

github.dismiss_out_of_range_messages

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn('PR is classed as Work in Progress') if github.pr_title.include? '[WIP]'

# Warn when there is a big PR
warn('Big PR') if git.lines_of_code > 300

# Lint
lint_output_path = ENV['LINT_OUTPUT'] || 'lint_output'
FileUtils.mkdir_p lint_output_path
checkstyle_format.base_path = Dir.pwd

## Rubocop
system(<<~SCRIPT)
  bundle exec rubocop \
  --require rubocop/formatter/checkstyle_formatter \
  --format RuboCop::Formatter::CheckstyleFormatter \
  --out #{lint_output_path}/rubocop.xml
SCRIPT
checkstyle_format.report "#{lint_output_path}/rubocop.xml"

## Rails Best Practices
system(<<~SCRIPT)
  bundle exec rails_best_practices . \
  --format xml \
  --output-file #{lint_output_path}/rails_best_practices.xml
SCRIPT
checkstyle_format.report "#{lint_output_path}/rails_best_practices.xml"

## reek
system(<<~SCRIPT)
  reek \
  --format xml \
  > #{lint_output_path}/reek.xml
SCRIPT
checkstyle_format.report "#{lint_output_path}/reek.xml"

## ESLint
system(<<~SCRIPT)
  ./bin/yarn lint:js \
  --format checkstyle \
  --output-file #{lint_output_path}/eslint.xml
SCRIPT
checkstyle_format.report "#{lint_output_path}/eslint.xml"

## stylelint
system(<<~SCRIPT)
  ./bin/yarn lint:css \
  --custom-formatter=node_modules/stylelint-checkstyle-formatter \
  > #{lint_output_path}/stylelint.xml
SCRIPT
checkstyle_format.report "#{lint_output_path}/stylelint.xml"
