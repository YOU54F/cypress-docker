describe('Hello world', () => {
  it('works', () => {
    cy.visit('https://applitools.com/helloworld/?diff2');

    //Start the test
    // cy.eyesOpen({
    //   testName: 'My first multibrowser test!',
    //   browser: [
    //     {width: 800, height: 600, name: 'firefox'},
    //     {width: 1024, height: 768, name: 'chrome'}
    //     //Add more variations
    //   ],
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