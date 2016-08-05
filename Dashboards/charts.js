$(document).ready(function () {

    var fullDateFormat = d3.time.format("%Y/%m/%d");
    var dayFormat = d3.time.format("%A");
    var yearFormat = d3.time.format("%Y");

    d3.csv("https://gist.githubusercontent.com/diflores/8193e84e1b820bd42fd1e2c373142033/raw/261e658beae0ca78d94d5aa3f705f2f3c7857a29/wendys_sample.csv", function (data) {

        // // console.log(data[0]);
        // data.forEach(function (d) {
        //     d.rating = +d.rating;
        //     d.foundation_full = fullDateFormat.parse(d.foundation_date);
        //     d.foundation_year = +yearFormat(d.foundation_full);
        //     // console.log(d.foundation_year);
        //     d.foundation_day = dayFormat(d.foundation_full);
        //     // console.log(d.foundation_day);
        // });


        // var myData = crossfilter(data);

        // // Variables independientes
        // var myDataDimension = myData.dimension(function (d) {return d;});
        // var dateDimension = myData.dimension(function(d) {return d.foundation_full;});
        // var dayDimension = myData.dimension(function (d) {return d.foundation_day;});
        // var ratingDimension= myData.dimension(function (d) {return d.rating;});

        // // Variables dependientes
        // var restaurantsDate = dateDimension.group().reduceCount();
        // var restaurantsDay = dayDimension.group().reduceCount();
        // var restaurantsRating = ratingDimension.group();


        // var datesChart = dc.lineChart("#dates");
        // var dayChart = dc.pieChart("#dayOfWeek");
        // var ratingsChart = dc.barChart("#ratings");
        // var dataTable = dc.dataTable('#data-table');

        // var dateArray = []; 
        // data.forEach(function (d){
        //     dateArray.push(d.foundation_full);
        // });
        // var dateMin = Math.min.apply(null,dateArray);
        // var dateMax = Math.max.apply(null,dateArray);


        // dateMin = dateDimension.bottom(1)[0].foundation_full;
        // dateMax = dateDimension.top(1)[0].foundation_full;

        // // console.log(dateMin);
        // // console.log(dateMax);

        // datesChart
        //     .width(960)
        //     .height(200)
        //     .dimension(dateDimension)
        //     .group(restaurantsDate)
        //     //.x(d3.time.scale().ordinal().domain([dateMin, dateMax]))
        //     .x(d3.time.scale().domain(d3.extent(data, function(d) { return d.foundation_full;})))
        //     .elasticY(true)
        //     .xAxis()
        //     .ticks(5);

        // dayChart
        //     .width(150)
        //     .height(150)
        //     .dimension(dayDimension)
        //     .group(restaurantsDay)
        //     .innerRadius(20);

        // ratingsChart
        //     .width(300)
        //     .height(180)
        //     .dimension(ratingDimension)
        //     .group(restaurantsRating)
        //     .x(d3.scale.linear().domain([0,6]))
        //     .elasticY(true)
        //     .centerBar(true)
        //     .margins({top: 10, right: 20, bottom: 50, left: 50})
        //     .xAxis()
        //     .tickValues([0, 1, 2, 3, 4, 5]);



        // dataTable
        //     .dimension(myDataDimension)
        //     .group(function () {return "Esta fila será removida";})
        //     .size(5879)
        //     .columns([
        //         function (d) {return d.name;},
        //         function (d) {return d.foundation_date;},
        //         function (d) {return d.address;},
        //         function (d) {return d.rating;}
        //     ])
        //     .sortBy(function(d) {return d.rating;})
        //     .order(d3.ascending);

        // dc.renderAll();



    })
});