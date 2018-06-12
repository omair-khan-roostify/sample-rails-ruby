# frozen_string_literal: true

github.dismiss_out_of_range_messages

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn('PR is classed as Work in Progress') if github.pr_title.include? '[WIP]'

# Warn when there is a big PR
warn('Big PR') if git.lines_of_code > 300

# Lint
rubocop.lint(force_exclusion: true,
             inline_comment:  true)
rails_best_practices.lint
reek.lint
