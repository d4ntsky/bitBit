<%@page import="movie.MovieManager"%>
<%@page import="dto.MovieVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

List<MovieVo> list = MovieManager.getCGVdata();

for(int i = 0; i < list.size(); i++) {
	System.out.println(list.get(i).toString());
}

// list -> json
String jsonlike = "[";

for(MovieVo m : list) {
	jsonlike += "{ name :'" + m.getTitle() + "', y:" + m.getLike() + "},";
}

jsonlike = jsonlike.substring(0, jsonlike.lastIndexOf(","));		//맨끝 , 제거

jsonlike += "]";

System.out.println(jsonlike);

request.setAttribute("jsonlike", jsonlike);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- w3school -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- highchart -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<style type="text/css" rel="stylesheet">
.highcharts-figure, .highcharts-data-table table {
  min-width: 320px; 
  max-width: 800px;
  margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
  padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
  padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}
.highcharts-data-table tr:hover {
  background: #f1f7ff;
}

input[type="number"] {
	min-width: 50px;
}
</style>


</head>
<body>

<figure class="highcharts-figure">
  <div id="container"></div>
  <p class="highcharts-description">
   
  </p>
</figure>

<script type="text/javascript">
Highcharts.chart('container', {
	  chart: {
	    plotBackgroundColor: null,
	    plotBorderWidth: null,
	    plotShadow: false,
	    type: 'pie'
	  },
	  title: {
	    text: '영화가 좋아요' /* 'Browser market shares in January, 2018' */
	  },
	  tooltip: {
	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	  },
	  accessibility: {
	    point: {
	      valueSuffix: '%'
	    }
	  },
	  plotOptions: {
	    pie: {
	      allowPointSelect: true,
	      cursor: 'pointer',
	      dataLabels: {
	        enabled: true,
	        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	      }
	    }
	  },
	  series: [{
	    name: 'Brands',
	    colorByPoint: true,
	    data: <%=request.getAttribute("jsonlike") %>
	    	
	    	/* [{
	      name: 'Chrome',
	      y: 61.41,
	      sliced: true,
	      selected: true
	    }, {
	      name: 'Internet Explorer',
	      y: 11.84
	    }, {
	      name: 'Firefox',
	      y: 10.85
	    }, {
	      name: 'Edge',
	      y: 4.67
	    }, {
	      name: 'Safari',
	      y: 4.18
	    }, {
	      name: 'Sogou Explorer',
	      y: 1.64
	    }, {
	      name: 'Opera',
	      y: 1.6
	    }, {
	      name: 'QQ',
	      y: 1.2
	    }, {
	      name: 'Other',
	      y: 2.61
	    }] */
	  }]
	});
</script>

</body>
</html>