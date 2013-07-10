GEM_ROOT = File.expand_path("../../..", __FILE__)
$:.unshift File.join(GEM_ROOT, "lib")

require 'rubygems'
require 'bundler/setup'
require 'rspec/expectations'

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
  @solutions = []
  @problem.solve do |solution|
    @solutions << solution
  end
end

Then(/^I expect solutions$/) do |table|
  table.hashes.each do |expected_solution|
    expect(@solutions).to include(expected_solution)
  end
end
