/* global Then */
Then(`I see {string} in the title`, (title) => {
  cy.title().should('include', title)
})