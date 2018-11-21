describe('Logging In - HTML Web Form - The Internet', function () {
  context('Unauthorized', function () {
    it('User denied access with invalid details', function () {
      cy.visit('/login')
      cy.url().should('include', 'login')
      cy.get('#username').type('invalidUser')
      cy.get('#password').type('invalidPassword{enter}')
      cy.get('.error').contains('Your username is invalid!')
      cy.get(".button").should('not.exist')
    })
    it('User granted access with valid details', function () {
      cy.visit('login')
      cy.url().should('include', 'login')
      cy.get('#username').type('tomsmith')
      cy.get('#password').type('SuperSecretPassword!{enter}')
      cy.get('.success').contains('You logged into a secure area!')
      cy.get(".button").should('exist')
    })
  })
})
