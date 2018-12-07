/* global Given */
// you can have external state, and also require things!
const url = 'https://google.com'

Given('I open Google page', () => {
  cy.visit(url)
})