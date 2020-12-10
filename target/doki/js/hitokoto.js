  fetch('https://v1.hitokoto.cn')
    .then(response => response.json())
    .then(data => {
      const hitokoto = document.getElementById('hitokoto')
      const hitokoto1=document.getElementById('hitokoto1')
      hitokoto.innerText = data.hitokoto
      hitokoto1.innerText =data.from
    })
    .catch(console.error)
