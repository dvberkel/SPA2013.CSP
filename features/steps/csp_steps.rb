GEM_ROOT = File.expand_path("../../..", __FILE__)
$:.unshift File.join(GEM_ROOT, "lib")

require 'csp'

Given(/^I have a CSP problem$/) do
  @problem = CSP.problem
end

Given(/^I have a variable '(\w+)' with domain \[(.*)\]$/) do |v, d|
  domain = d.split(/,\s*/)
  variable = CSP.variable(v).withDomain(domain)
  @problem.addVariable(variable)
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
