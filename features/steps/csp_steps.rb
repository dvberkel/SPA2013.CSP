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

Given(/^I have a constraint: (.*)$/) do |c|
  data = /(?<left>\w+)\s+(?<operator>!?=)\s+(?<right>.+)/.match(c)
  left = CSP.valueOf(data[:left])
  right = CSP.valueOf(data[:right])
  case data[:operator]
  when "="
    constraint = CSP.equal(left, right)
  when "!="
    constraint = CSP.not_equal(left, right)
  end
  @problem.addConstraint(constraint)
end

When(/^I solve the problem$/) do
  @solutions = []
  @problem.solve do |solution|
    @solutions << solution
  end
end

Then(/^I expect solutions$/) do |table|
  hashes = table.hashes
  hashes.each do |expected_solution|
    expect(@solutions).to include(expected_solution)
  end
  @solutions.each do |proposed_solution|
    expect(hashes).to include(proposed_solution)
  end
end
