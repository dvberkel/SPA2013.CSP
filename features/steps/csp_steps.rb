GEM_ROOT = File.expand_path("../../..", __FILE__)
$:.unshift File.join(GEM_ROOT, "lib")

require 'csp'

Given(/^I have a CSP problem$/) do
  @problem = CSP.problem
end

Given(/^I have a variable '(\w+)' with domain \[(.*)\]$/) do |variable, domain|
  pending # express the regexp above with the code you wish you had
end

Given(/^I have a constraint: (.*)$/) do |constraint|
  pending # express the regexp above with the code you wish you had
end

When(/^I solve the problem$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I expect solutions$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end
