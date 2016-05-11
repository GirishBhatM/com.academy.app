 <body onload="window.print();">
  <div>
    <h2>Academy</h2>
    <br><br>
    <p>Received following fees from <b>${name}</b> for the course <b>${title}</b></p>
    <br>
    <table>
     <thead><tr><td>Fee</td><td></td><td></td><td>Date</td></tr></thead>
     <tbody>
     <g:each in="${model}" var="fee">
       <tr><td>${fee.feepaid}</td><td></td><td></td><td>${fee.date}</td></tr>
      </g:each>
     </tbody>
    </table>
    <b>Signature:</b>
    <br>
  </div>
</body>