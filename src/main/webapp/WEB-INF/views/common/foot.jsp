<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<script>
   $(".circle_percent")
         .each(
               function() {
                  var $this = $(this), $dataV = $this.data("percent"), $dataDeg = $dataV * 3.6, $round = $this
                        .find(".round_per");
                  $round.css("transform", "rotate("
                        + parseInt($dataDeg + 180) + "deg)");
                  $this
                        .append('<div class="circle_inbox"><span class="percent_text"></span></div>');
                  $this.prop('Counter', 0).animate(
                        {
                           Counter : $dataV
                        },
                        {
                           duration : 2000,
                           easing : 'swing',
                           step : function(now) {
                              $this.find(".percent_text").text(
                                    Math.ceil(now) + "%");
                           }
                        });
                  if ($dataV >= 51) {
                     $round.css("transform", "rotate(" + 360 + "deg)");
                     setTimeout(function() {
                        $this.addClass("percent_more");
                     }, 1000);
                     setTimeout(function() {
                        $round.css("transform", "rotate("
                              + parseInt($dataDeg + 180) + "deg)");
                     }, 1000);
                  }
               });
</script>



</body>
</html>