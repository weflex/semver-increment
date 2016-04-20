bumpVersion = require '..'

describe 'Bump SemVer number', () ->

  it 'Should bump version according to masks', () ->
    expect(bumpVersion [0, 0, 1], '0.1.0').toBe '0.1.1'
