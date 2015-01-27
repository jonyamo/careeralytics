$ ->
  $(".input-daterange").datepicker({
    autoclose: true,
    format: "yyyy-mm-dd"
  }).on("changeDate", (e) ->
    $("#datepicker-end").datepicker("setStartDate", e.date)
  )
