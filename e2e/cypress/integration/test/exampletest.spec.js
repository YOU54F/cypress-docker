let arr = []
let x = 0

describe('This test also push to array', function () {
  it('test', function () {
    console.log("arr1 is" + arr)
    x = 1
    arr.push(x)
    console.log("arr2 is" + arr)
    arr.map((x, i) => {
      console.log('test')
      it(x, () => {
        console.log('testsadas')
        console.log('testing ', x)
      }) 
    })
  })

});