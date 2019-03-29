function getTable() {
        
        var i;
        for (i = 1; i < 11; i++) {
          var report = document.getElementById("rp"+i);
          var sales1 = document.getElementById("r"+i+"s1");
          var sales2 = document.getElementById("r"+i+"s2");
          var incen1 = document.getElementById("r"+i+"i1");
          var incen2 = document.getElementById("r"+i+"i2");
          var total  = document.getElementById("t"+i);
        
          report.innerHTML = "Date "+i;
          sales1.innerHTML = i;
          sales2.innerHTML = i;
          incen1.innerHTML = "Level 1";
          incen2.innerHTML = "Level 1";
          total.innerHTML  = i;
        }
    }