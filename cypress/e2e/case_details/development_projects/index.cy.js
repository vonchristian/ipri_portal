describe('Case Detail Page', () => {
  before(() => {
    // Log in via API to skip UI login
    cy.login('test@test.com', 'Test123!@#')
  })

  it('displays case details', () => {
    cy.visit('http://localhost:3000/documenters/case_details/018341e3-2392-4b6b-aa4a-4092e00a0191/development_projects') // replace with your actual case route

    // Verify case title
    cy.contains('Development Projects').should('be.visible')
  })
})