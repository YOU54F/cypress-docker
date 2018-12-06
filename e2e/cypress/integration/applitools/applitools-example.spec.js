describe('Hello world', () => {
  it('works', () => {
    cy.visit('https://applitools.com/helloworld?diff1');

    //Start the test
    // cy.eyesOpen({
    //   testName: 'My first single browser test!',
    //   browser: { width: 800, height: 600 },
    // });

    // Add checkpoint #1 (This is test step #1)
    // cy.eyesCheckWindow('Main Page');

    cy.get('button').click();

    // Add checkpoint #2 (This is test step #2)
    // cy.eyesCheckWindow('Click!');

    //End Test
    // cy.eyesClose();
  });
});