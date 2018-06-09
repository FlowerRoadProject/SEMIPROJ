/**
 * Resize function without multiple trigger
 * 
 * Usage:
 * $(window).smartresize(function(){  
 *     // code here
 * });
 */
(function($,sr){
    // debouncing function from John Hann
    // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
    var debounce = function (func, threshold, execAsap) {
      var timeout;

        return function debounced () {
            var obj = this, args = arguments;
            function delayed () {
                if (!execAsap)
                    func.apply(obj, args); 
                timeout = null; 
            }

            if (timeout)
                clearTimeout(timeout);
            else if (execAsap)
                func.apply(obj, args);

            timeout = setTimeout(delayed, threshold || 100); 
        };
    };

    // smartresize 
    jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');
/**
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var CURRENT_URL = window.location.href.split('#')[0].split('?')[0],
    $BODY = $('body'),
    $MENU_TOGGLE = $('#menu_toggle'),
    $SIDEBAR_MENU = $('#sidebar-menu'),
    $SIDEBAR_FOOTER = $('.sidebar-footer'),
    $LEFT_COL = $('.left_col'),
    $RIGHT_COL = $('.right_col'),
    $NAV_MENU = $('.nav_menu'),
    $FOOTER = $('footer');

	
	
// Sidebar
function init_sidebar() {
// TODO: This is some kind of easy fix, maybe we can improve this
var setContentHeight = function () {
	// reset height
	$RIGHT_COL.css('min-height', $(window).height());

	var bodyHeight = $BODY.outerHeight(),
		footerHeight = $BODY.hasClass('footer_fixed') ? -10 : $FOOTER.height(),
		leftColHeight = $LEFT_COL.eq(1).height() + $SIDEBAR_FOOTER.height(),
		contentHeight = bodyHeight < leftColHeight ? leftColHeight : bodyHeight;

	// normalize content
	contentHeight -= $NAV_MENU.height() + footerHeight;

	$RIGHT_COL.css('min-height', contentHeight);
};

  $SIDEBAR_MENU.find('a').on('click', function(ev) {
        var $li = $(this).parent();

        if ($li.is('.active')) {
            $li.removeClass('active active-sm');
            $('ul:first', $li).slideUp(function() {
                setContentHeight();
            });
        } else {
            // prevent closing menu if we are on child menu
            if (!$li.parent().is('.child_menu')) {
                $SIDEBAR_MENU.find('li').removeClass('active active-sm');
                $SIDEBAR_MENU.find('li ul').slideUp();
            }else
            {
				if ( $BODY.is( ".nav-sm" ) )
				{
					$SIDEBAR_MENU.find( "li" ).removeClass( "active active-sm" );
					$SIDEBAR_MENU.find( "li ul" ).slideUp();
				}
			}
            $li.addClass('active');

            $('ul:first', $li).slideDown(function() {
                setContentHeight();
            });
        }
    });

// toggle small or large menu 
$MENU_TOGGLE.on('click', function() {
		
		if ($BODY.hasClass('nav-md')) {
			$SIDEBAR_MENU.find('li.active ul').hide();
			$SIDEBAR_MENU.find('li.active').addClass('active-sm').removeClass('active');
            $('#admin').css('display','inline-block');
		} else {
			$SIDEBAR_MENU.find('li.active-sm ul').show();
			$SIDEBAR_MENU.find('li.active-sm').addClass('active').removeClass('active-sm');
            $('#admin').css('display','none');
		}

	$BODY.toggleClass('nav-md nav-sm');

	setContentHeight();

	$('.dataTable').each ( function () { $(this).dataTable().fnDraw(); });
});

	// check active menu
	$SIDEBAR_MENU.find('a[href="' + CURRENT_URL + '"]').parent('li').addClass('current-page');

	$SIDEBAR_MENU.find('a').filter(function () {
		return this.href == CURRENT_URL;
	}).parent('li').addClass('current-page').parents('ul').slideDown(function() {
		setContentHeight();
	}).parent().addClass('active');

	// recompute content when resizing
	$(window).smartresize(function(){  
		setContentHeight();
	});

	setContentHeight();

	// fixed sidebar
	if ($.fn.mCustomScrollbar) {
		$('.menu_fixed').mCustomScrollbar({
			autoHideScrollbar: true,
			theme: 'minimal',
			mouseWheel:{ preventDefault: true }
		});
	}
};
// /Sidebar

	var randNum = function() {
	  return (Math.floor(Math.random() * (1 + 40 - 20))) + 20;
	};


// Panel toolbox
$(document).ready(function() {
    $('.collapse-link').on('click', function() {
        var $BOX_PANEL = $(this).closest('.x_panel'),
            $ICON = $(this).find('i'),
            $BOX_CONTENT = $BOX_PANEL.find('.x_content');
        
        // fix for some div with hardcoded fix class
        if ($BOX_PANEL.attr('style')) {
            $BOX_CONTENT.slideToggle(200, function(){
                $BOX_PANEL.removeAttr('style');
            });
        } else {
            $BOX_CONTENT.slideToggle(200); 
            $BOX_PANEL.css('height', 'auto');  
        }

        $ICON.toggleClass('fa-chevron-up fa-chevron-down');
    });

    $('.close-link').click(function () {
        var $BOX_PANEL = $(this).closest('.x_panel');

        $BOX_PANEL.remove();
    });
});
// /Panel toolbox

// Tooltip
$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip({
        container: 'body'
    });
});
// /Tooltip

// Progressbar
if ($(".progress .progress-bar")[0]) {
    $('.progress .progress-bar').progressbar();
}
// /Progressbar

// Switchery
$(document).ready(function() {
    if ($(".js-switch")[0]) {
        var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
        elems.forEach(function (html) {
            var switchery = new Switchery(html, {
                color: '#26B99A'
            });
        });
    }
});
// /Switchery


// iCheck
$(document).ready(function() {
    if ($("input.flat")[0]) {
        $(document).ready(function () {
            $('input.flat').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
            });
        });
    }
});
// /iCheck

// Table
$('table input').on('ifChecked', function () {
    checkState = '';
    $(this).parent().parent().parent().addClass('selected');
    countChecked();
});
$('table input').on('ifUnchecked', function () {
    checkState = '';
    $(this).parent().parent().parent().removeClass('selected');
    countChecked();
});

var checkState = '';

$('.bulk_action input').on('ifChecked', function () {
    checkState = '';
    $(this).parent().parent().parent().addClass('selected');
    countChecked();
});
$('.bulk_action input').on('ifUnchecked', function () {
    checkState = '';
    $(this).parent().parent().parent().removeClass('selected');
    countChecked();
});
$('.bulk_action input#check-all').on('ifChecked', function () {
    checkState = 'all';
    countChecked();
});
$('.bulk_action input#check-all').on('ifUnchecked', function () {
    checkState = 'none';
    countChecked();
});

function countChecked() {
    if (checkState === 'all') {
        $(".bulk_action input[name='table_records']").iCheck('check');
    }
    if (checkState === 'none') {
        $(".bulk_action input[name='table_records']").iCheck('uncheck');
    }

    var checkCount = $(".bulk_action input[name='table_records']:checked").length;

    if (checkCount) {
        $('.column-title').hide();
        $('.bulk-actions').show();
        $('.action-cnt').html(checkCount + ' Records Selected');
    } else {
        $('.column-title').show();
        $('.bulk-actions').hide();
    }
}



// Accordion
$(document).ready(function() {
    $(".expand").on("click", function () {
        $(this).next().slideToggle(200);
        $expand = $(this).find(">:first-child");

        if ($expand.text() == "+") {
            $expand.text("-");
        } else {
            $expand.text("+");
        }
    });
});

// NProgress
if (typeof NProgress != 'undefined') {
    $(document).ready(function () {
        NProgress.start();
    });

    $(window).load(function () {
        NProgress.done();
    });
}

	
	  //hover and retain popover when on popover content
        var originalLeave = $.fn.popover.Constructor.prototype.leave;
        $.fn.popover.Constructor.prototype.leave = function(obj) {
          var self = obj instanceof this.constructor ?
            obj : $(obj.currentTarget)[this.type](this.getDelegateOptions()).data('bs.' + this.type);
          var container, timeout;

          originalLeave.call(this, obj);

          if (obj.currentTarget) {
            container = $(obj.currentTarget).siblings('.popover');
            timeout = self.timeout;
            container.one('mouseenter', function() {
              //We entered the actual popover – call off the dogs
              clearTimeout(timeout);
              //Let's monitor popover content instead
              container.one('mouseleave', function() {
                $.fn.popover.Constructor.prototype.leave.call(self, self);
              });
            });
          }
        };

        $('body').popover({
          selector: '[data-popover]',
          trigger: 'click hover',
          delay: {
            show: 50,
            hide: 400
          }
        });


	function gd(year, month, day) {
		return new Date(year, month - 1, day).getTime();
	}
	  
	
	function init_flot_chart(){
		
		if( typeof ($.plot) === 'undefined'){ return; }
		
		
		
		
		var arr_data1 = [
			[gd(2012, 1, 1), 17],
			[gd(2012, 1, 2), 74],
			[gd(2012, 1, 3), 6],
			[gd(2012, 1, 4), 39],
			[gd(2012, 1, 5), 20],
			[gd(2012, 1, 6), 85],
			[gd(2012, 1, 7), 7]
		];

		var arr_data2 = [
		  [gd(2012, 1, 1), 82],
		  [gd(2012, 1, 2), 23],
		  [gd(2012, 1, 3), 66],
		  [gd(2012, 1, 4), 9],
		  [gd(2012, 1, 5), 119],
		  [gd(2012, 1, 6), 6],
		  [gd(2012, 1, 7), 9]
		];
		
		var arr_data3 = [
			[0, 1],
			[1, 9],
			[2, 6],
			[3, 10],
			[4, 5],
			[5, 17],
			[6, 6],
			[7, 10],
			[8, 7],
			[9, 11],
			[10, 35],
			[11, 9],
			[12, 12],
			[13, 5],
			[14, 3],
			[15, 4],
			[16, 9]
		];
		
		var chart_plot_02_data = [];
		
		var chart_plot_03_data = [
			[0, 1],
			[1, 9],
			[2, 6],
			[3, 10],
			[4, 5],
			[5, 17],
			[6, 6],
			[7, 10],
			[8, 7],
			[9, 11],
			[10, 35],
			[11, 9],
			[12, 12],
			[13, 5],
			[14, 3],
			[15, 4],
			[16, 9]
		];
		
		
		for (var i = 0; i < 30; i++) {
		  chart_plot_02_data.push([new Date(Date.today().add(i).days()).getTime(), randNum() + i + i + 10]);
		}
		
		
		var chart_plot_01_settings = {
          series: {
            lines: {
              show: false,
              fill: true
            },
            splines: {
              show: true,
              tension: 0.4,
              lineWidth: 1,
              fill: 0.4
            },
            points: {
              radius: 0,
              show: true
            },
            shadowSize: 2
          },
          grid: {
            verticalLines: true,
            hoverable: true,
            clickable: true,
            tickColor: "#d5d5d5",
            borderWidth: 1,
            color: '#fff'
          },
          colors: ["rgba(38, 185, 154, 0.38)", "rgba(3, 88, 106, 0.38)"],
          xaxis: {
            tickColor: "rgba(51, 51, 51, 0.06)",
            mode: "time",
            tickSize: [1, "day"],
            //tickLength: 10,
            axisLabel: "Date",
            axisLabelUseCanvas: true,
            axisLabelFontSizePixels: 12,
            axisLabelFontFamily: 'Verdana, Arial',
            axisLabelPadding: 10
          },
          yaxis: {
            ticks: 8,
            tickColor: "rgba(51, 51, 51, 0.06)",
          },
          tooltip: false
        }
		
		var chart_plot_02_settings = {
			grid: {
				show: true,
				aboveData: true,
				color: "#3f3f3f",
				labelMargin: 10,
				axisMargin: 0,
				borderWidth: 0,
				borderColor: null,
				minBorderMargin: 5,
				clickable: true,
				hoverable: true,
				autoHighlight: true,
				mouseActiveRadius: 100
			},
			series: {
				lines: {
					show: true,
					fill: true,
					lineWidth: 2,
					steps: false
				},
				points: {
					show: true,
					radius: 4.5,
					symbol: "circle",
					lineWidth: 3.0
				}
			},
			legend: {
				position: "ne",
				margin: [0, -25],
				noColumns: 0,
				labelBoxBorderColor: null,
				labelFormatter: function(label, series) {
					return label + '&nbsp;&nbsp;';
				},
				width: 40,
				height: 1
			},
			colors: ['#96CA59', '#3F97EB', '#72c380', '#6f7a8a', '#f7cb38', '#5a8022', '#2c7282'],
			shadowSize: 0,
			tooltip: true,
			tooltipOpts: {
				content: "%s: %y.0",
				xDateFormat: "%d/%m",
			shifts: {
				x: -30,
				y: -50
			},
			defaultTheme: false
			},
			yaxis: {
				min: 0
			},
			xaxis: {
				mode: "time",
				minTickSize: [1, "day"],
				timeformat: "%d/%m/%y",
				min: chart_plot_02_data[0][0],
				max: chart_plot_02_data[20][0]
			}
		};	
	
		var chart_plot_03_settings = {
			series: {
				curvedLines: {
					apply: true,
					active: true,
					monotonicFit: true
				}
			},
			colors: ["#26B99A"],
			grid: {
				borderWidth: {
					top: 0,
					right: 0,
					bottom: 1,
					left: 1
				},
				borderColor: {
					bottom: "#7F8790",
					left: "#7F8790"
				}
			}
		};
        
		
        if ($("#chart_plot_01").length){
			
			$.plot( $("#chart_plot_01"), [ arr_data1, arr_data2 ],  chart_plot_01_settings );
		}
		
		
		if ($("#chart_plot_02").length){
			
			$.plot( $("#chart_plot_02"), 
			[{ 
				label: "Email Sent", 
				data: chart_plot_02_data, 
				lines: { 
					fillColor: "rgba(150, 202, 89, 0.12)" 
				}, 
				points: { 
					fillColor: "#fff" } 
			}], chart_plot_02_settings);
			
		}
		
		if ($("#chart_plot_03").length){
			
			
			$.plot($("#chart_plot_03"), [{
				label: "Registrations",
				data: chart_plot_03_data,
				lines: {
					fillColor: "rgba(150, 202, 89, 0.12)"
				}, 
				points: {
					fillColor: "#fff"
				}
			}], chart_plot_03_settings);
			
		};
	  
	} 
	
		
	/* STARRR */
			
	function init_starrr() {
		
		if( typeof (starrr) === 'undefined'){ return; }
		
		$(".stars").starrr();

		$('.stars-existing').starrr({
		  rating: 4
		});

		$('.stars').on('starrr:change', function (e, value) {
		  $('.stars-count').html(value);
		});

		$('.stars-existing').on('starrr:change', function (e, value) {
		  $('.stars-count-existing').html(value);
		});
		
	  };
	
	
	function init_JQVmap(){

		
		if(typeof (jQuery.fn.vectorMap) === 'undefined'){ return; }
		
	     
			if ($('#world-map-gdp').length ){
		 
				$('#world-map-gdp').vectorMap({
					map: 'world_en',
					backgroundColor: null,
					color: '#ffffff',
					hoverOpacity: 0.7,
					selectedColor: '#666666',
					enableZoom: true,
					showTooltip: true,
					values: sample_data,
					scaleColors: ['#E6F2F0', '#149B7E'],
					normalizeFunction: 'polynomial'
				});
			
			}
			
			if ($('#usa_map').length ){
			
				$('#usa_map').vectorMap({
					map: 'usa_en',
					backgroundColor: null,
					color: '#ffffff',
					hoverOpacity: 0.7,
					selectedColor: '#666666',
					enableZoom: true,
					showTooltip: true,
					values: sample_data,
					scaleColors: ['#E6F2F0', '#149B7E'],
					normalizeFunction: 'polynomial'
				});
			
			}
			
	};
			
	    
	function init_skycons(){
				
			if( typeof (Skycons) === 'undefined'){ return; }
		
			var icons = new Skycons({
				"color": "#73879C"
			  }),
			  list = [
				"clear-day", "clear-night", "partly-cloudy-day",
				"partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
				"fog"
			  ],
			  i;

			for (i = list.length; i--;)
			  icons.set(list[i], list[i]);

			icons.play();
	
	}  
	   
	   
	function init_chart_doughnut(){
				
		if( typeof (Chart) === 'undefined'){ return; }
			 
		if ($('.canvasDoughnut').length){
			
		var chart_doughnut_settings = {
				type: 'doughnut',
				tooltipFillColor: "rgba(51, 51, 51, 0.55)",
				data: {
					labels: [
						"Symbian",
						"Blackberry",
						"Other",
						"Android",
						"IOS"
					],
					datasets: [{
						data: [15, 20, 30, 10, 30],
						backgroundColor: [
							"#BDC3C7",
							"#9B59B6",
							"#E74C3C",
							"#26B99A",
							"#3498DB"
						],
						hoverBackgroundColor: [
							"#CFD4D8",
							"#B370CF",
							"#E95E4F",
							"#36CAAB",
							"#49A9EA"
						]
					}]
				},
				options: { 
					legend: false, 
					responsive: false 
				}
			}
		
			$('.canvasDoughnut').each(function(){
				
				var chart_element = $(this);
				var chart_doughnut = new Chart( chart_element, chart_doughnut_settings);
				
			});			
		
		}  
	   
	}
	   
	function init_gauge() {
			
		if( typeof (Gauge) === 'undefined'){ return; }		

		  var chart_gauge_settings = {
		  lines: 12,
		  angle: 0,
		  lineWidth: 0.4,
		  pointer: {
			  length: 0.75,
			  strokeWidth: 0.042,
			  color: '#1D212A'
		  },
		  limitMax: 'false',
		  colorStart: '#1ABC9C',
		  colorStop: '#1ABC9C',
		  strokeColor: '#F0F3F3',
		  generateGradient: true
	  };
		
		
		if ($('#chart_gauge_01').length){ 
		
			var chart_gauge_01_elem = document.getElementById('chart_gauge_01');
			var chart_gauge_01 = new Gauge(chart_gauge_01_elem).setOptions(chart_gauge_settings);
			
		}	
		
		
		if ($('#gauge-text').length){ 
		
			chart_gauge_01.maxValue = 6000;
			chart_gauge_01.animationSpeed = 32;
			chart_gauge_01.set(3200);
			chart_gauge_01.setTextField(document.getElementById("gauge-text"));
		
		}
		
		if ($('#chart_gauge_02').length){
		
			var chart_gauge_02_elem = document.getElementById('chart_gauge_02');
			var chart_gauge_02 = new Gauge(chart_gauge_02_elem).setOptions(chart_gauge_settings);
			
		}
		
		
		if ($('#gauge-text2').length){
			
			chart_gauge_02.maxValue = 9000;
			chart_gauge_02.animationSpeed = 32;
			chart_gauge_02.set(2400);
			chart_gauge_02.setTextField(document.getElementById("gauge-text2"));
		
		}
	
	
	}   
	   	   
	/* SPARKLINES */
			
		function init_sparklines() {
			
			if(typeof (jQuery.fn.sparkline) === 'undefined'){ return; }			
			
			$(".sparkline_one").sparkline([2, 4, 3, 4, 5, 4, 5, 4, 3, 4, 5, 6, 4, 5, 6, 3, 5, 4, 5, 4, 5, 4, 3, 4, 5, 6, 7, 5, 4, 3, 5, 6], {
				type: 'bar',
				height: '125',
				barWidth: 13,
				colorMap: {
					'7': '#a1a1a1'
				},
				barSpacing: 2,
				barColor: '#26B99A'
			});
			
			
			$(".sparkline_two").sparkline([2, 4, 3, 4, 5, 4, 5, 4, 3, 4, 5, 6, 7, 5, 4, 3, 5, 6], {
				type: 'bar',
				height: '40',
				barWidth: 9,
				colorMap: {
					'7': '#a1a1a1'	
				},
				barSpacing: 2,
				barColor: '#26B99A'
			});
			
			
			$(".sparkline_three").sparkline([2, 4, 3, 4, 5, 4, 5, 4, 3, 4, 5, 6, 7, 5, 4, 3, 5, 6], {
				type: 'line',
				width: '200',
				height: '40',
				lineColor: '#26B99A',
				fillColor: 'rgba(223, 223, 223, 0.57)',
				lineWidth: 2,
				spotColor: '#26B99A',
				minSpotColor: '#26B99A'
			});
			
			
			$(".sparkline11").sparkline([2, 4, 3, 4, 5, 4, 5, 4, 3, 4, 6, 2, 4, 3, 4, 5, 4, 5, 4, 3], {
				type: 'bar',
				height: '40',
				barWidth: 8,
				colorMap: {
					'7': '#a1a1a1'
				},
				barSpacing: 2,
				barColor: '#26B99A'
			});
			
			
			$(".sparkline22").sparkline([2, 4, 3, 4, 7, 5, 4, 3, 5, 6, 2, 4, 3, 4, 5, 4, 5, 4, 3, 4, 6], {
				type: 'line',
				height: '40',
				width: '200',
				lineColor: '#26B99A',
				fillColor: '#ffffff',
				lineWidth: 3,
				spotColor: '#34495E',
				minSpotColor: '#34495E'
			});
	
	
			$(".sparkline_bar").sparkline([2, 4, 3, 4, 5, 4, 5, 4, 3, 4, 5, 6, 4, 5, 6, 3, 5], {
				type: 'bar',
				colorMap: {
					'7': '#a1a1a1'
				},
				barColor: '#26B99A'
			});
			
			
			$(".sparkline_area").sparkline([5, 6, 7, 9, 9, 5, 3, 2, 2, 4, 6, 7], {
				type: 'line',
				lineColor: '#26B99A',
				fillColor: '#26B99A',
				spotColor: '#4578a0',
				minSpotColor: '#728fb2',
				maxSpotColor: '#6d93c4',
				highlightSpotColor: '#ef5179',
				highlightLineColor: '#8ba8bf',
				spotRadius: 2.5,
				width: 85
			});
			
			
			$(".sparkline_line").sparkline([2, 4, 3, 4, 5, 4, 5, 4, 3, 4, 5, 6, 4, 5, 6, 3, 5], {
				type: 'line',
				lineColor: '#26B99A',
				fillColor: '#ffffff',
				width: 85,
				spotColor: '#34495E',
				minSpotColor: '#34495E'
			});
			
			
			$(".sparkline_pie").sparkline([1, 1, 2, 1], {
				type: 'pie',
				sliceColors: ['#26B99A', '#ccc', '#75BCDD', '#D66DE2']
			});
			
			
			$(".sparkline_discreet").sparkline([4, 6, 7, 7, 4, 3, 2, 1, 4, 4, 2, 4, 3, 7, 8, 9, 7, 6, 4, 3], {
				type: 'discrete',
				barWidth: 3,
				lineColor: '#26B99A',
				width: '85',
			});

			
		};   
	   
	   
	   /* AUTOCOMPLETE */
			
		function init_autocomplete() {
			
			if( typeof ($.fn.autocomplete) === 'undefined'){ return; }
			
			var countries = { AD:"Andorra",A2:"Andorra Test",AE:"United Arab Emirates",AF:"Afghanistan",AG:"Antigua and Barbuda",AI:"Anguilla",AL:"Albania",AM:"Armenia",AN:"Netherlands Antilles",AO:"Angola",AQ:"Antarctica",AR:"Argentina",AS:"American Samoa",AT:"Austria",AU:"Australia",AW:"Aruba",AX:"Åland Islands",AZ:"Azerbaijan",BA:"Bosnia and Herzegovina",BB:"Barbados",BD:"Bangladesh",BE:"Belgium",BF:"Burkina Faso",BG:"Bulgaria",BH:"Bahrain",BI:"Burundi",BJ:"Benin",BL:"Saint Barthélemy",BM:"Bermuda",BN:"Brunei",BO:"Bolivia",BQ:"British Antarctic Territory",BR:"Brazil",BS:"Bahamas",BT:"Bhutan",BV:"Bouvet Island",BW:"Botswana",BY:"Belarus",BZ:"Belize",CA:"Canada",CC:"Cocos [Keeling] Islands",CD:"Congo - Kinshasa",CF:"Central African Republic",CG:"Congo - Brazzaville",CH:"Switzerland",CI:"Côte d’Ivoire",CK:"Cook Islands",CL:"Chile",CM:"Cameroon",CN:"China",CO:"Colombia",CR:"Costa Rica",CS:"Serbia and Montenegro",CT:"Canton and Enderbury Islands",CU:"Cuba",CV:"Cape Verde",CX:"Christmas Island",CY:"Cyprus",CZ:"Czech Republic",DD:"East Germany",DE:"Germany",DJ:"Djibouti",DK:"Denmark",DM:"Dominica",DO:"Dominican Republic",DZ:"Algeria",EC:"Ecuador",EE:"Estonia",EG:"Egypt",EH:"Western Sahara",ER:"Eritrea",ES:"Spain",ET:"Ethiopia",FI:"Finland",FJ:"Fiji",FK:"Falkland Islands",FM:"Micronesia",FO:"Faroe Islands",FQ:"French Southern and Antarctic Territories",FR:"France",FX:"Metropolitan France",GA:"Gabon",GB:"United Kingdom",GD:"Grenada",GE:"Georgia",GF:"French Guiana",GG:"Guernsey",GH:"Ghana",GI:"Gibraltar",GL:"Greenland",GM:"Gambia",GN:"Guinea",GP:"Guadeloupe",GQ:"Equatorial Guinea",GR:"Greece",GS:"South Georgia and the South Sandwich Islands",GT:"Guatemala",GU:"Guam",GW:"Guinea-Bissau",GY:"Guyana",HK:"Hong Kong SAR China",HM:"Heard Island and McDonald Islands",HN:"Honduras",HR:"Croatia",HT:"Haiti",HU:"Hungary",ID:"Indonesia",IE:"Ireland",IL:"Israel",IM:"Isle of Man",IN:"India",IO:"British Indian Ocean Territory",IQ:"Iraq",IR:"Iran",IS:"Iceland",IT:"Italy",JE:"Jersey",JM:"Jamaica",JO:"Jordan",JP:"Japan",JT:"Johnston Island",KE:"Kenya",KG:"Kyrgyzstan",KH:"Cambodia",KI:"Kiribati",KM:"Comoros",KN:"Saint Kitts and Nevis",KP:"North Korea",KR:"South Korea",KW:"Kuwait",KY:"Cayman Islands",KZ:"Kazakhstan",LA:"Laos",LB:"Lebanon",LC:"Saint Lucia",LI:"Liechtenstein",LK:"Sri Lanka",LR:"Liberia",LS:"Lesotho",LT:"Lithuania",LU:"Luxembourg",LV:"Latvia",LY:"Libya",MA:"Morocco",MC:"Monaco",MD:"Moldova",ME:"Montenegro",MF:"Saint Martin",MG:"Madagascar",MH:"Marshall Islands",MI:"Midway Islands",MK:"Macedonia",ML:"Mali",MM:"Myanmar [Burma]",MN:"Mongolia",MO:"Macau SAR China",MP:"Northern Mariana Islands",MQ:"Martinique",MR:"Mauritania",MS:"Montserrat",MT:"Malta",MU:"Mauritius",MV:"Maldives",MW:"Malawi",MX:"Mexico",MY:"Malaysia",MZ:"Mozambique",NA:"Namibia",NC:"New Caledonia",NE:"Niger",NF:"Norfolk Island",NG:"Nigeria",NI:"Nicaragua",NL:"Netherlands",NO:"Norway",NP:"Nepal",NQ:"Dronning Maud Land",NR:"Nauru",NT:"Neutral Zone",NU:"Niue",NZ:"New Zealand",OM:"Oman",PA:"Panama",PC:"Pacific Islands Trust Territory",PE:"Peru",PF:"French Polynesia",PG:"Papua New Guinea",PH:"Philippines",PK:"Pakistan",PL:"Poland",PM:"Saint Pierre and Miquelon",PN:"Pitcairn Islands",PR:"Puerto Rico",PS:"Palestinian Territories",PT:"Portugal",PU:"U.S. Miscellaneous Pacific Islands",PW:"Palau",PY:"Paraguay",PZ:"Panama Canal Zone",QA:"Qatar",RE:"Réunion",RO:"Romania",RS:"Serbia",RU:"Russia",RW:"Rwanda",SA:"Saudi Arabia",SB:"Solomon Islands",SC:"Seychelles",SD:"Sudan",SE:"Sweden",SG:"Singapore",SH:"Saint Helena",SI:"Slovenia",SJ:"Svalbard and Jan Mayen",SK:"Slovakia",SL:"Sierra Leone",SM:"San Marino",SN:"Senegal",SO:"Somalia",SR:"Suriname",ST:"São Tomé and Príncipe",SU:"Union of Soviet Socialist Republics",SV:"El Salvador",SY:"Syria",SZ:"Swaziland",TC:"Turks and Caicos Islands",TD:"Chad",TF:"French Southern Territories",TG:"Togo",TH:"Thailand",TJ:"Tajikistan",TK:"Tokelau",TL:"Timor-Leste",TM:"Turkmenistan",TN:"Tunisia",TO:"Tonga",TR:"Turkey",TT:"Trinidad and Tobago",TV:"Tuvalu",TW:"Taiwan",TZ:"Tanzania",UA:"Ukraine",UG:"Uganda",UM:"U.S. Minor Outlying Islands",US:"United States",UY:"Uruguay",UZ:"Uzbekistan",VA:"Vatican City",VC:"Saint Vincent and the Grenadines",VD:"North Vietnam",VE:"Venezuela",VG:"British Virgin Islands",VI:"U.S. Virgin Islands",VN:"Vietnam",VU:"Vanuatu",WF:"Wallis and Futuna",WK:"Wake Island",WS:"Samoa",YD:"People's Democratic Republic of Yemen",YE:"Yemen",YT:"Mayotte",ZA:"South Africa",ZM:"Zambia",ZW:"Zimbabwe",ZZ:"Unknown or Invalid Region" };

			var countriesArray = $.map(countries, function(value, key) {
			  return {
				value: value,
				data: key
			  };
			});

			// initialize autocomplete with custom appendTo
			$('#autocomplete-custom-append').autocomplete({
			  lookup: countriesArray
			});
			
		};
	   
	 /* AUTOSIZE */
			
		function init_autosize() {
			
			if(typeof $.fn.autosize !== 'undefined'){
			
			autosize($('.resizable_textarea'));
			
			}
			
		};  
	   
	   /* PARSLEY */
			
		function init_parsley() {
			
			if( typeof (parsley) === 'undefined'){ return; }
			
			$/*.listen*/('parsley:field:validate', function() {
			  validateFront();
			});
			$('#demo-form .btn').on('click', function() {
			  $('#demo-form').parsley().validate();
			  validateFront();
			});
			var validateFront = function() {
			  if (true === $('#demo-form').parsley().isValid()) {
				$('.bs-callout-info').removeClass('hidden');
				$('.bs-callout-warning').addClass('hidden');
			  } else {
				$('.bs-callout-info').addClass('hidden');
				$('.bs-callout-warning').removeClass('hidden');
			  }
			};
		  
			$/*.listen*/('parsley:field:validate', function() {
			  validateFront();
			});
			$('#demo-form2 .btn').on('click', function() {
			  $('#demo-form2').parsley().validate();
			  validateFront();
			});
			var validateFront = function() {
			  if (true === $('#demo-form2').parsley().isValid()) {
				$('.bs-callout-info').removeClass('hidden');
				$('.bs-callout-warning').addClass('hidden');
			  } else {
				$('.bs-callout-info').addClass('hidden');
				$('.bs-callout-warning').removeClass('hidden');
			  }
			};
			
			  try {
				hljs.initHighlightingOnLoad();
			  } catch (err) {}
			
		};
	   
		
		  /* INPUTS */
		  
			function onAddTag(tag) {
				alert("Added a tag: " + tag);
			  }

			  function onRemoveTag(tag) {
				alert("Removed a tag: " + tag);
			  }

			  function onChangeTag(input, tag) {
				alert("Changed a tag: " + tag);
			  }

			  //tags input
			function init_TagsInput() {
				  
				if(typeof $.fn.tagsInput !== 'undefined'){	
				 
				$('#tags_1').tagsInput({
				  width: 'auto'
				});
				
				}
				
		    };
	   
		/* SELECT2 */
	  
		function init_select2() {
			 
			if( typeof (select2) === 'undefined'){ return; }
			 
			$(".select2_single").select2({
			  placeholder: "Select a state",
			  allowClear: true
			});
			$(".select2_group").select2({});
			$(".select2_multiple").select2({
			  maximumSelectionLength: 4,
			  placeholder: "With Max Selection limit 4",
			  allowClear: true
			});
			
		};
	   
	   /* WYSIWYG EDITOR */

		function init_wysiwyg() {
			
		if( typeof ($.fn.wysiwyg) === 'undefined'){ return; }
			
        function init_ToolbarBootstrapBindings() {
          var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
              'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
              'Times New Roman', 'Verdana'
            ],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
          $.each(fonts, function(idx, fontName) {
            fontTarget.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">' + fontName + '</a></li>'));
          });
          $('a[title]').tooltip({
            container: 'body'
          });
          $('.dropdown-menu input').click(function() {
              return false;
            })
            .change(function() {
              $(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
            })
            .keydown('esc', function() {
              this.value = '';
              $(this).change();
            });

          $('[data-role=magic-overlay]').each(function() {
            var overlay = $(this),
              target = $(overlay.data('target'));
            overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
          });

          if ("onwebkitspeechchange" in document.createElement("input")) {
            var editorOffset = $('#editor').offset();

            $('.voiceBtn').css('position', 'absolute').offset({
              top: editorOffset.top,
              left: editorOffset.left + $('#editor').innerWidth() - 35
            });
          } else {
            $('.voiceBtn').hide();
          }
        }

        function showErrorAlert(reason, detail) {
          var msg = '';
          if (reason === 'unsupported-file-type') {
            msg = "Unsupported format " + detail;
          } else {
          }
          $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
            '<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
        }

       $('.editor-wrapper').each(function(){
			var id = $(this).attr('id');	//editor-one
			
			$(this).wysiwyg({
				toolbarSelector: '[data-target="#' + id + '"]',
				fileUploadError: showErrorAlert
			});	
		});
 
		
        window.prettyPrint;
        prettyPrint();
	
    };
	  
	/* CROPPER */
		
		function init_cropper() {
			
			
			if( typeof ($.fn.cropper) === 'undefined'){ return; }
			
			var $image = $('#image');
			var $download = $('#download');
			var $dataX = $('#dataX');
			var $dataY = $('#dataY');
			var $dataHeight = $('#dataHeight');
			var $dataWidth = $('#dataWidth');
			var $dataRotate = $('#dataRotate');
			var $dataScaleX = $('#dataScaleX');
			var $dataScaleY = $('#dataScaleY');
			var options = {
				  aspectRatio: 16 / 9,
				  preview: '.img-preview',
				  crop: function (e) {
					$dataX.val(Math.round(e.x));
					$dataY.val(Math.round(e.y));
					$dataHeight.val(Math.round(e.height));
					$dataWidth.val(Math.round(e.width));
					$dataRotate.val(e.rotate);
					$dataScaleX.val(e.scaleX);
					$dataScaleY.val(e.scaleY);
				  }
				};


			// Tooltip
			$('[data-toggle="tooltip"]').tooltip();


			// Cropper
			$image.on({
			  'build.cropper': function (e) {
			  },
			  'built.cropper': function (e) {
			  },
			  'cropstart.cropper': function (e) {
			  },
			  'cropmove.cropper': function (e) {
			  },
			  'cropend.cropper': function (e) {
			  },
			  'crop.cropper': function (e) {
			  },
			  'zoom.cropper': function (e) {
			  }
			}).cropper(options);


			// Buttons
			if (!$.isFunction(document.createElement('canvas').getContext)) {
			  $('button[data-method="getCroppedCanvas"]').prop('disabled', true);
			}

			if (typeof document.createElement('cropper').style.transition === 'undefined') {
			  $('button[data-method="rotate"]').prop('disabled', true);
			  $('button[data-method="scale"]').prop('disabled', true);
			}


			// Download
			if (typeof $download[0].download === 'undefined') {
			  $download.addClass('disabled');
			}


			// Options
			$('.docs-toggles').on('change', 'input', function () {
			  var $this = $(this);
			  var name = $this.attr('name');
			  var type = $this.prop('type');
			  var cropBoxData;
			  var canvasData;

			  if (!$image.data('cropper')) {
				return;
			  }

			  if (type === 'checkbox') {
				options[name] = $this.prop('checked');
				cropBoxData = $image.cropper('getCropBoxData');
				canvasData = $image.cropper('getCanvasData');

				options.built = function () {
				  $image.cropper('setCropBoxData', cropBoxData);
				  $image.cropper('setCanvasData', canvasData);
				};
			  } else if (type === 'radio') {
				options[name] = $this.val();
			  }

			  $image.cropper('destroy').cropper(options);
			});


			// Methods
			$('.docs-buttons').on('click', '[data-method]', function () {
			  var $this = $(this);
			  var data = $this.data();
			  var $target;
			  var result;

			  if ($this.prop('disabled') || $this.hasClass('disabled')) {
				return;
			  }

			  if ($image.data('cropper') && data.method) {
				data = $.extend({}, data); // Clone a new one

				if (typeof data.target !== 'undefined') {
				  $target = $(data.target);

				  if (typeof data.option === 'undefined') {
					try {
					  data.option = JSON.parse($target.val());
					} catch (e) {
					}
				  }
				}

				result = $image.cropper(data.method, data.option, data.secondOption);

				switch (data.method) {
				  case 'scaleX':
				  case 'scaleY':
					$(this).data('option', -data.option);
					break;

				  case 'getCroppedCanvas':
					if (result) {

					  // Bootstrap's Modal
					  $('#getCroppedCanvasModal').modal().find('.modal-body').html(result);

					  if (!$download.hasClass('disabled')) {
						$download.attr('href', result.toDataURL());
					  }
					}

					break;
				}

				if ($.isPlainObject(result) && $target) {
				  try {
					$target.val(JSON.stringify(result));
				  } catch (e) {
				  }
				}

			  }
			});

			// Keyboard
			$(document.body).on('keydown', function (e) {
			  if (!$image.data('cropper') || this.scrollTop > 300) {
				return;
			  }

			  switch (e.which) {
				case 37:
				  e.preventDefault();
				  $image.cropper('move', -1, 0);
				  break;

				case 38:
				  e.preventDefault();
				  $image.cropper('move', 0, -1);
				  break;

				case 39:
				  e.preventDefault();
				  $image.cropper('move', 1, 0);
				  break;

				case 40:
				  e.preventDefault();
				  $image.cropper('move', 0, 1);
				  break;
			  }
			});

			// Import image
			var $inputImage = $('#inputImage');
			var URL = window.URL || window.webkitURL;
			var blobURL;

			if (URL) {
			  $inputImage.change(function () {
				var files = this.files;
				var file;

				if (!$image.data('cropper')) {
				  return;
				}

				if (files && files.length) {
				  file = files[0];

				  if (/^image\/\w+$/.test(file.type)) {
					blobURL = URL.createObjectURL(file);
					$image.one('built.cropper', function () {

					  // Revoke when load complete
					  URL.revokeObjectURL(blobURL);
					}).cropper('reset').cropper('replace', blobURL);
					$inputImage.val('');
				  } else {
					window.alert('Please choose an image file.');
				  }
				}
			  });
			} else {
			  $inputImage.prop('disabled', true).parent().addClass('disabled');
			}
			
			
		};
		
		/* CROPPER --- end */  
	  
		/* KNOB */
	  
		function init_knob() {
		
				if( typeof ($.fn.knob) === 'undefined'){ return; }
	
				$(".knob").knob({
				  change: function(value) {
				  },
				  release: function(value) {
				  },
				  cancel: function() {
				  },
				  draw: function() {

					// "tron" case
					if (this.$.data('skin') == 'tron') {

					  this.cursorExt = 0.3;

					  var a = this.arc(this.cv) // Arc
						,
						pa // Previous arc
						, r = 1;

					  this.g.lineWidth = this.lineWidth;

					  if (this.o.displayPrevious) {
						pa = this.arc(this.v);
						this.g.beginPath();
						this.g.strokeStyle = this.pColor;
						this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, pa.s, pa.e, pa.d);
						this.g.stroke();
					  }

					  this.g.beginPath();
					  this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
					  this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, a.s, a.e, a.d);
					  this.g.stroke();

					  this.g.lineWidth = 2;
					  this.g.beginPath();
					  this.g.strokeStyle = this.o.fgColor;
					  this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
					  this.g.stroke();

					  return false;
					}
				  }
				  
				});

				// Example of infinite knob, iPod click wheel
				var v, up = 0,
				  down = 0,
				  i = 0,
				  $idir = $("div.idir"),
				  $ival = $("div.ival"),
				  incr = function() {
					i++;
					$idir.show().html("+").fadeOut();
					$ival.html(i);
				  },
				  decr = function() {
					i--;
					$idir.show().html("-").fadeOut();
					$ival.html(i);
				  };
				$("input.infinite").knob({
				  min: 0,
				  max: 20,
				  stopper: false,
				  change: function() {
					if (v > this.cv) {
					  if (up) {
						decr();
						up = 0;
					  } else {
						up = 1;
						down = 0;
					  }
					} else {
					  if (v < this.cv) {
						if (down) {
						  incr();
						  down = 0;
						} else {
						  down = 1;
						  up = 0;
						}
					  }
					}
					v = this.cv;
				  }
				});
				
		};
	 
		/* INPUT MASK */
			
		function init_InputMask() {
			
			if( typeof ($.fn.inputmask) === 'undefined'){ return; }
			
				$(":input").inputmask();
				
		};
	  
		/* COLOR PICKER */
			 
		function init_ColorPicker() {
			
			if( typeof ($.fn.colorpicker) === 'undefined'){ return; }
			
				$('.demo1').colorpicker();
				$('.demo2').colorpicker();

				$('#demo_forceformat').colorpicker({
					format: 'rgba',
					horizontal: true
				});

				$('#demo_forceformat3').colorpicker({
					format: 'rgba',
				});

				$('.demo-auto').colorpicker();
			
		}; 
	   
	   
		/* ION RANGE SLIDER */
			
		function init_IonRangeSlider() {
			
			if( typeof ($.fn.ionRangeSlider) === 'undefined'){ return; }
			
			$("#range_27").ionRangeSlider({
			  type: "double",
			  min: 1000000,
			  max: 2000000,
			  grid: true,
			  force_edges: true
			});
			$("#range").ionRangeSlider({
			  hide_min_max: true,
			  keyboard: true,
			  min: 0,
			  max: 5000,
			  from: 1000,
			  to: 4000,
			  type: 'double',
			  step: 1,
			  prefix: "$",
			  grid: true
			});
			$("#range_25").ionRangeSlider({
			  type: "double",
			  min: 1000000,
			  max: 2000000,
			  grid: true
			});
			$("#range_26").ionRangeSlider({
			  type: "double",
			  min: 0,
			  max: 10000,
			  step: 500,
			  grid: true,
			  grid_snap: true
			});
			$("#range_31").ionRangeSlider({
			  type: "double",
			  min: 0,
			  max: 100,
			  from: 30,
			  to: 70,
			  from_fixed: true
			});
			$(".range_min_max").ionRangeSlider({
			  type: "double",
			  min: 0,
			  max: 100,
			  from: 30,
			  to: 70,
			  max_interval: 50
			});
			$(".range_time24").ionRangeSlider({
			  min: +moment().subtract(12, "hours").format("X"),
			  max: +moment().format("X"),
			  from: +moment().subtract(6, "hours").format("X"),
			  grid: true,
			  force_edges: true,
			  prettify: function(num) {
				var m = moment(num, "X");
				return m.format("Do MMMM, HH:mm");
			  }
			});
			
		};
	   
	   
	   /* DATERANGEPICKER */
	   
		function init_daterangepicker() {

			if( typeof ($.fn.daterangepicker) === 'undefined'){ return; }
		
			var cb = function(start, end, label) {
			  $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
			};

			var optionSet1 = {
			  startDate: moment().subtract(29, 'days'),
			  endDate: moment(),
			  minDate: '01/01/2012',
			  maxDate: '12/31/2015',
			  dateLimit: {
				days: 60
			  },
			  showDropdowns: true,
			  showWeekNumbers: true,
			  timePicker: false,
			  timePickerIncrement: 1,
			  timePicker12Hour: true,
			  ranges: {
				'Today': [moment(), moment()],
				'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
				'Last 7 Days': [moment().subtract(6, 'days'), moment()],
				'Last 30 Days': [moment().subtract(29, 'days'), moment()],
				'This Month': [moment().startOf('month'), moment().endOf('month')],
				'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
			  },
			  opens: 'left',
			  buttonClasses: ['btn btn-default'],
			  applyClass: 'btn-small btn-primary',
			  cancelClass: 'btn-small',
			  format: 'MM/DD/YYYY',
			  separator: ' to ',
			  locale: {
				applyLabel: 'Submit',
				cancelLabel: 'Clear',
				fromLabel: 'From',
				toLabel: 'To',
				customRangeLabel: 'Custom',
				daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
				monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
				firstDay: 1
			  }
			};
			
			$('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
			$('#reportrange').daterangepicker(optionSet1, cb);
			$('#reportrange').on('show.daterangepicker', function() {
			});
			$('#reportrange').on('hide.daterangepicker', function() {
			});
			$('#reportrange').on('apply.daterangepicker', function(ev, picker) {
			});
			$('#reportrange').on('cancel.daterangepicker', function(ev, picker) {
			});
			$('#options1').click(function() {
			  $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
			});
			$('#options2').click(function() {
			  $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
			});
			$('#destroy').click(function() {
			  $('#reportrange').data('daterangepicker').remove();
			});
   
		}
   	   
	   function init_daterangepicker_right() {
	      
				if( typeof ($.fn.daterangepicker) === 'undefined'){ return; }
		  
				var cb = function(start, end, label) {
				  $('#reportrange_right span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
				};

				var optionSet1 = {
				  startDate: moment().subtract(29, 'days'),
				  endDate: moment(),
				  minDate: '01/01/2012',
				  maxDate: '12/31/2020',
				  dateLimit: {
					days: 60
				  },
				  showDropdowns: true,
				  showWeekNumbers: true,
				  timePicker: false,
				  timePickerIncrement: 1,
				  timePicker12Hour: true,
				  ranges: {
					'Today': [moment(), moment()],
					'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
					'Last 7 Days': [moment().subtract(6, 'days'), moment()],
					'Last 30 Days': [moment().subtract(29, 'days'), moment()],
					'This Month': [moment().startOf('month'), moment().endOf('month')],
					'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
				  },
				  opens: 'right',
				  buttonClasses: ['btn btn-default'],
				  applyClass: 'btn-small btn-primary',
				  cancelClass: 'btn-small',
				  format: 'MM/DD/YYYY',
				  separator: ' to ',
				  locale: {
					applyLabel: 'Submit',
					cancelLabel: 'Clear',
					fromLabel: 'From',
					toLabel: 'To',
					customRangeLabel: 'Custom',
					daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
					monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
					firstDay: 1
				  }
				};

				$('#reportrange_right span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));

				$('#reportrange_right').daterangepicker(optionSet1, cb);

				$('#reportrange_right').on('show.daterangepicker', function() {
				});
				$('#reportrange_right').on('hide.daterangepicker', function() {
				});
				$('#reportrange_right').on('apply.daterangepicker', function(ev, picker) {
				});
				$('#reportrange_right').on('cancel.daterangepicker', function(ev, picker) {
				});

				$('#options1').click(function() {
				  $('#reportrange_right').data('daterangepicker').setOptions(optionSet1, cb);
				});

				$('#options2').click(function() {
				  $('#reportrange_right').data('daterangepicker').setOptions(optionSet2, cb);
				});

				$('#destroy').click(function() {
				  $('#reportrange_right').data('daterangepicker').remove();
				});

	   }
	   
	    function init_daterangepicker_single_call() {
	      
			if( typeof ($.fn.daterangepicker) === 'undefined'){ return; }
		   
			$('#single_cal1').daterangepicker({
			  singleDatePicker: true,
			  singleClasses: "picker_1"
			}, function(start, end, label) {
			});
			$('#single_cal2').daterangepicker({
			  singleDatePicker: true,
			  singleClasses: "picker_2"
			}, function(start, end, label) {
			});
			$('#single_cal3').daterangepicker({
			  singleDatePicker: true,
			  singleClasses: "picker_3"
			}, function(start, end, label) {
			});
			$('#single_cal4').daterangepicker({
			  singleDatePicker: true,
			  singleClasses: "picker_4"
			}, function(start, end, label) {
			});
  
  
		}
		
		 
		function init_daterangepicker_reservation() {
	      
			if( typeof ($.fn.daterangepicker) === 'undefined'){ return; }
		 
			$('#reservation').daterangepicker(null, function(start, end, label) {
			});

			$('#reservation-time').daterangepicker({
			  timePicker: true,
			  timePickerIncrement: 30,
			  locale: {
				format: 'MM/DD/YYYY h:mm A'
			  }
			});
	
		}
	   
	   /* SMART WIZARD */
		
		function init_SmartWizard() {
			
			if( typeof ($.fn.smartWizard) === 'undefined'){ return; }
			
			$('#wizard').smartWizard();

			$('#wizard_verticle').smartWizard({
			  transitionEffect: 'slide'
			});

			$('.buttonNext').addClass('btn btn-success');
			$('.buttonPrevious').addClass('btn btn-primary');
			$('.buttonFinish').addClass('btn btn-default');
			
		};
	   
	   
	  /* VALIDATOR */

	  function init_validator () {
		 
		if( typeof (validator) === 'undefined'){ return; }
	  
	  // initialize the validator function
      validator.message.date = 'not a real date';

      // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
      $('form')
        .on('blur', 'input[required], input.optional, select.required', validator.checkField)
        .on('change', 'select.required', validator.checkField)
        .on('keypress', 'input[required][pattern]', validator.keypress);

      $('.multi.required').on('keyup blur', 'input', function() {
        validator.checkField.apply($(this).siblings().last()[0]);
      });

      $('form').submit(function(e) {
        e.preventDefault();
        var submit = true;

        // evaluate the form using generic validaing
        if (!validator.checkAll($(this))) {
          submit = false;
        }

        if (submit)
          this.submit();

        return false;
		});
	  
	  };
	   
	  	/* PNotify */
			
		function init_PNotify() {
			
			if( typeof (PNotify) === 'undefined'){ return; }
		}; 
	   
	   
	   /* CUSTOM NOTIFICATION */
			
		function init_CustomNotification() {
						
			if( typeof (CustomTabs) === 'undefined'){ return; }
			
			var cnt = 10;

			TabbedNotification = function(options) {
			  var message = "<div id='ntf" + cnt + "' class='text alert-" + options.type + "' style='display:none'><h2><i class='fa fa-bell'></i> " + options.title +
				"</h2><div class='close'><a href='javascript:;' class='notification_close'><i class='fa fa-close'></i></a></div><p>" + options.text + "</p></div>";

			  if (!document.getElementById('custom_notifications')) {
				alert('doesnt exists');
			  } else {
				$('#custom_notifications ul.notifications').append("<li><a id='ntlink" + cnt + "' class='alert-" + options.type + "' href='#ntf" + cnt + "'><i class='fa fa-bell animated shake'></i></a></li>");
				$('#custom_notifications #notif-group').append(message);
				cnt++;
				CustomTabs(options);
			  }
			};

			CustomTabs = function(options) {
			  $('.tabbed_notifications > div').hide();
			  $('.tabbed_notifications > div:first-of-type').show();
			  $('#custom_notifications').removeClass('dsp_none');
			  $('.notifications a').click(function(e) {
				e.preventDefault();
				var $this = $(this),
				  tabbed_notifications = '#' + $this.parents('.notifications').data('tabbed_notifications'),
				  others = $this.closest('li').siblings().children('a'),
				  target = $this.attr('href');
				others.removeClass('active');
				$this.addClass('active');
				$(tabbed_notifications).children('div').hide();
				$(target).show();
			  });
			};

			CustomTabs();

			var tabid = idname = '';

			$(document).on('click', '.notification_close', function(e) {
			  idname = $(this).parent().parent().attr("id");
			  tabid = idname.substr(-2);
			  $('#ntf' + tabid).remove();
			  $('#ntlink' + tabid).parent().remove();
			  $('.notifications a').first().addClass('active');
			  $('#notif-group div').first().css('display', 'block');
			});
			
		};
		
			/* EASYPIECHART */
			
			function init_EasyPieChart() {
				
				if( typeof ($.fn.easyPieChart) === 'undefined'){ return; }
				
				$('.chart').easyPieChart({
				  easing: 'easeOutElastic',
				  delay: 3000,
				  barColor: '#26B99A',
				  trackColor: '#fff',
				  scaleColor: false,
				  lineWidth: 20,
				  trackWidth: 16,
				  lineCap: 'butt',
				  onStep: function(from, to, percent) {
					$(this.el).find('.percent').text(Math.round(percent));
				  }
				});
				var chart = window.chart = $('.chart').data('easyPieChart');
				$('.js_update').on('click', function() {
				  chart.update(Math.random() * 200 - 100);
				});

				//hover and retain popover when on popover content
				var originalLeave = $.fn.popover.Constructor.prototype.leave;
				$.fn.popover.Constructor.prototype.leave = function(obj) {
				  var self = obj instanceof this.constructor ?
					obj : $(obj.currentTarget)[this.type](this.getDelegateOptions()).data('bs.' + this.type);
				  var container, timeout;

				  originalLeave.call(this, obj);

				  if (obj.currentTarget) {
					container = $(obj.currentTarget).siblings('.popover');
					timeout = self.timeout;
					container.one('mouseenter', function() {
					  //We entered the actual popover – call off the dogs
					  clearTimeout(timeout);
					  //Let's monitor popover content instead
					  container.one('mouseleave', function() {
						$.fn.popover.Constructor.prototype.leave.call(self, self);
					  });
					});
				  }
				};

				$('body').popover({
				  selector: '[data-popover]',
				  trigger: 'click hover',
				  delay: {
					show: 50,
					hide: 400
				  }
				});
				
			};

		/* COMPOSE */
		
		function init_compose() {
		
			if( typeof ($.fn.slideToggle) === 'undefined'){ return; }
		
			$('#compose, .compose-close').click(function(){
				$('.compose').slideToggle();
			});
		
		};
	   
	   	/* CALENDAR */
		  
		    function  init_calendar() {
					
				if( typeof ($.fn.fullCalendar) === 'undefined'){ return; }
					
				var date = new Date(),
					d = date.getDate(),
					m = date.getMonth(),
					y = date.getFullYear(),
					started,
					categoryClass;

				var calendar = $('#calendar').fullCalendar({
				  header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay,listMonth'
				  },
				  selectable: true,
				  selectHelper: true,
				  select: function(start, end, allDay) {
					$('#fc_create').click();

					started = start;
					ended = end;

					$(".antosubmit").on("click", function() {
					  var title = $("#title").val();
					  if (end) {
						ended = end;
					  }

					  categoryClass = $("#event_type").val();

					  if (title) {
						calendar.fullCalendar('renderEvent', {
							title: title,
							start: started,
							end: end,
							allDay: allDay
						  },
						  true // make the event "stick"
						);
					  }

					  $('#title').val('');

					  calendar.fullCalendar('unselect');

					  $('.antoclose').click();

					  return false;
					});
				  },
				  eventClick: function(calEvent, jsEvent, view) {
					$('#fc_edit').click();
					$('#title2').val(calEvent.title);

					categoryClass = $("#event_type").val();

					$(".antosubmit2").on("click", function() {
					  calEvent.title = $("#title2").val();

					  calendar.fullCalendar('updateEvent', calEvent);
					  $('.antoclose2').click();
					});

					calendar.fullCalendar('unselect');
				  },
				  editable: true,
				  events: [{
					title: 'All Day Event',
					start: new Date(y, m, 1)
				  }, {
					title: 'Long Event',
					start: new Date(y, m, d - 5),
					end: new Date(y, m, d - 2)
				  }, {
					title: 'Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				  }, {
					title: 'Lunch',
					start: new Date(y, m, d + 14, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				  }, {
					title: 'Birthday Party',
					start: new Date(y, m, d + 1, 19, 0),
					end: new Date(y, m, d + 1, 22, 30),
					allDay: false
				  }, {
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				  }]
				});
				
			};
	   
		/* DATA TABLES */
			
			function init_DataTables() {
								
				if( typeof ($.fn.DataTable) === 'undefined'){ return; }
				
				var handleDataTableButtons = function() {
				  if ($("#datatable-buttons").length) {
					$("#datatable-buttons").DataTable({
					  dom: "Blfrtip",
					  buttons: [
						{
						  extend: "copy",
						  className: "btn-sm"
						},
						{
						  extend: "csv",
						  className: "btn-sm"
						},
						{
						  extend: "excel",
						  className: "btn-sm"
						},
						{
						  extend: "pdfHtml5",
						  className: "btn-sm"
						},
						{
						  extend: "print",
						  className: "btn-sm"
						},
					  ],
					  responsive: true
					});
				  }
				};

				TableManageButtons = function() {
				  "use strict";
				  return {
					init: function() {
					  handleDataTableButtons();
					}
				  };
				}();

				$('#datatable').dataTable();

				$('#datatable-keytable').DataTable({
				  keys: true
				});

				$('#datatable-responsive').DataTable();

				$('#datatable-scroller').DataTable({
				  ajax: "js/datatables/json/scroller-demo.json",
				  deferRender: true,
				  scrollY: 380,
				  scrollCollapse: true,
				  scroller: true
				});

				$('#datatable-fixed-header').DataTable({
				  fixedHeader: true
				});

				var $datatable = $('#datatable-checkbox');

				$datatable.dataTable({
				  'order': [[ 1, 'asc' ]],
				  'columnDefs': [
					{ orderable: false, targets: [0] }
				  ]
				});
				$datatable.on('draw.dt', function() {
				  $('checkbox input').iCheck({
					checkboxClass: 'icheckbox_flat-green'
				  });
				});

				TableManageButtons.init();
				
			};
	
	
//주문/배송조회
$('.deliveryTable>tbody>tr').on({
    'click':function(){
        var orderNum = $(this).children().eq(0).text();
        var memberNum = $(this).children().eq(1).text();
        var productNum = $(this).children().eq(2).text();
        var stateCode = $(this).children().eq(4).text();
        $('.orderCheck>tbody>tr').children().eq(0).text(orderNum);
        $('.orderCheck>tbody>tr').children().eq(1).text(memberNum);
        $('.orderCheck>tbody>tr').children().eq(2).text(productNum);
        switch(stateCode){
            case "결제 완료": 
                $('#paying').children('a').removeClass('done');
                $('#paying').siblings().children('a').removeClass('done');
                $('#paying').siblings().children('a').removeClass('selected');
                $('#paying').children('a').removeClass('disabled');
                $('#paying').children('a').addClass('selected');
                $('#paying').siblings().children('a').addClass('disabled');
                break;
            case "상품 준비": 
                $('#paycom').children('a').removeClass('done');
                $('#paycom').siblings().children('a').removeClass('done');
                $('#paycom').siblings().children('a').removeClass('selected');
                $('#paycom').children('a').removeClass('disabled');
                $('#paycom').children('a').addClass('selected');
                $('#paycom').siblings().children('a').addClass('disabled');
                break;
            case "배송 출발": 
                $('#deling').children('a').removeClass('done');
                $('#deling').siblings().children('a').removeClass('done');
                $('#deling').siblings().children('a').removeClass('selected');
                $('#deling').children('a').removeClass('disabled');
                $('#deling').children('a').addClass('selected');
                $('#deling').siblings().children('a').addClass('disabled');
                break;
            case "배송 완료": 
                $('#delcom').children('a').removeClass('done');
                $('#delcom').siblings().children('a').removeClass('done');
                $('#delcom').siblings().children('a').removeClass('selected');
                $('#delcom').children('a').removeClass('disabled');
                $('#delcom').children('a').addClass('selected');
                $('#delcom').siblings().children('a').addClass('disabled');
                break;
            default:
            	$('#paying').children('a').removeClass('done');
	            $('#paying').siblings().children('a').removeClass('done');
	            $('#paying').children('a').removeClass('selected');
	            $('#paying').siblings().children('a').removeClass('selected');
	            $('#paying').children('a').addClass('disabled');
	            $('#paying').siblings().children('a').addClass('disabled');
        };
    }
});
$('#paying').on({
    'click': function(){
        $(this).children('a').addClass('done');
        $(this).siblings().children('a').removeClass('done');
    }
});
$('#paycom').on({
    'click': function(){
        $(this).children('a').addClass('done');
        $(this).siblings().children('a').removeClass('done');
    }
});
$('#deling').on({
    'click': function(){
        $(this).children('a').addClass('done');
        $(this).siblings().children('a').removeClass('done');
    }
});
$('#delcom').on({
    'click': function(){
        $(this).children('a').addClass('done');
        $(this).siblings().children('a').removeClass('done');
    }
});
//주문제작 조회
$('.DIYTable>tbody>tr').on({
    'click':function(){
        var DIYNum = $(this).children().eq(0).text();
        var memberNum = $(this).children().eq(1).text();
        var stateCode = $(this).children().eq(3).text();
        $('.DIYCheck>tbody>tr').children().eq(0).text(DIYNum);
        $('.DIYCheck>tbody>tr').children().eq(1).text(memberNum);
        switch(stateCode){
            case "결제대기": 
                $('#paying').children('a').removeClass('done');
                $('#paying').siblings().children('a').removeClass('done');
                $('#paying').siblings().children('a').removeClass('selected');
                $('#paying').children('a').removeClass('disabled');
                $('#paying').children('a').addClass('selected');
                $('#paying').siblings().children('a').addClass('disabled');
                break;
            case "결제완료": 
                $('#paycom').children('a').removeClass('done');
                $('#paycom').siblings().children('a').removeClass('done');
                $('#paycom').siblings().children('a').removeClass('selected');
                $('#paycom').children('a').removeClass('disabled');
                $('#paycom').children('a').addClass('selected');
                $('#paycom').siblings().children('a').addClass('disabled');
                break;
            case "제작시작": 
                $('#deling').children('a').removeClass('done');
                $('#deling').siblings().children('a').removeClass('done');
                $('#deling').siblings().children('a').removeClass('selected');
                $('#deling').children('a').removeClass('disabled');
                $('#deling').children('a').addClass('selected');
                $('#deling').siblings().children('a').addClass('disabled');
                break;
            case "제작완료": 
                $('#delcom').children('a').removeClass('done');
                $('#delcom').siblings().children('a').removeClass('done');
                $('#delcom').siblings().children('a').removeClass('selected');
                $('#delcom').children('a').removeClass('disabled');
                $('#delcom').children('a').addClass('selected');
                $('#delcom').siblings().children('a').addClass('disabled');
                break;
        };
    }
});
$('#paying').on({
    'click': function(){
        $(this).children('a').addClass('done');
        $(this).siblings().children('a').removeClass('done');
    }
});
$('#paycom').on({
    'click': function(){
        $(this).children('a').addClass('done');
        $(this).siblings().children('a').removeClass('done');
    }
});
$('#deling').on({
    'click': function(){
        $(this).children('a').addClass('done');
        $(this).siblings().children('a').removeClass('done');
    }
});
$('#delcom').on({
    'click': function(){
        $(this).children('a').addClass('done');
        $(this).siblings().children('a').removeClass('done');
    }
});
$('.DIYRetrieve').on('click',function(){
    $('.DIYslide').slideUp(500);
});

//상품 조회
$('.productTable>tbody>tr').on({
    'click':function(){
        var PNum = $(this).children().eq(0).text();
        var PCategory = $(this).children().eq(1).text();
        var PName = $(this).children().eq(2).text();
        var PStock = $(this).children().eq(4).text();
        var PCost = $(this).children().eq(5).text();
        var PPrice = $(this).children().eq(6).text();
        var POrigin = $(this).children().eq(7).text();
        var PEvent = ($(this).children().eq(8).text());
        var PImage = $(this).children().eq(9).text();
        $('.PImage').attr('src',mainPath+'/resources/images/product/'+PImage);
        $('.PNum').val(PNum);
        $('.PName').val(PName);
        $('#selectCategory').val(PCategory).prop('selected',true);
        $('#selectOrigin').val(POrigin).prop('selected',true);
        $('#selectPEvent').val(PEvent).prop('selected',true);
        $('.PStock').val(PStock);
        $('.PCost').val(PCost);
        $('.PPrice').val(PPrice);
    }
});
function PInfoImgChange(){
    var PImageChange = $('.PInfoImage').val().substr(12);
    $('.PImage').attr('src',mainPath+'/resources/images/product/'+PImageChange);
};
function PInfoImgRegi(){
    var PImageRegi = $('.PInfoImage2').val().substr(12);
    $('.PImgeRegi').attr('src',mainPath+'/resources/images/product/'+PImageRegi);
};
//회원 조회
$('.memberTable>tbody>tr').on({
    'click':function(){
        var MNum = $(this).children().eq(0).text();
        var MId = $(this).children().eq(1).text();
        var MPw = $(this).children().eq(2).text();
        var MEnrollDate = $(this).children().eq(3).text();
        var MGrade = $(this).children().eq(4).text();
        var MName = $(this).children().eq(5).text();
        var MBirth = $(this).children().eq(6).text();
        var MGender = $(this).children().eq(7).text();
        var MPhone = $(this).children().eq(8).text();
        var MEmail = $(this).children().eq(9).text();
        var MAddress = $(this).children().eq(10).text();
        var MImage = $(this).children().eq(11).text();
        var MTotalPrice = $(this).children().eq(12).text();
        
        if(MImage!='null') $('.MImage').attr('src',mainPath+'/resources/images/member/'+MImage);
        $('.MNum').val(MNum);
        $('.MId').val(MId);
        $('.MPw').val(MPw);
        $('.MGrade').val(MGrade);
        $('.MName').val(MName);
        $('.MEnrollDate').val(MEnrollDate);
        $('.MBirth').val(MBirth);
        $('.MGender').val(MGender);
        $('.MPhone').val(MPhone);
        $('.MEmail').val(MEmail);
        $('.MAddress').val(MAddress);
        $('.MTotalPrice').val(MTotalPrice);
    }
});
//관리자 조회
$('.adminTable>tbody>tr').on({
    'click':function(){
        var ANum = $(this).children().eq(0).text();
        var AId = $(this).children().eq(1).text();
        var APw = $(this).children().eq(2).text();
        var AEnrollDate = $(this).children().eq(3).text();
        var AName = $(this).children().eq(4).text();
        var ASecurity = $(this).children().eq(5).text();
        var ABirth = $(this).children().eq(6).text();
        var AGender = $(this).children().eq(7).text();
        var APhone = $(this).children().eq(8).text();
        var AEmail = $(this).children().eq(9).text();
        var AAddress = $(this).children().eq(10).text();
        var AImage = $(this).children().eq(11).text();
        $('.AImage').attr('src',mainPath+'/resources/images/admin/'+AImage);
        $('.ANum').val(ANum);
        $('.AId').val(AId);
        $('.APw').val(APw);
        $('.AName').val(AName);
        $('.AGender').val(AGender);
        $('.ABirth').val(ABirth);
        $('.AEnrollDate').val(AEnrollDate);
        $('.APhone').val(APhone);
        $('.AEmail').val(AEmail);
        $('.AAddress').val(AAddress);
        $('.ASecurity').val(ASecurity);
    }
});
function AInfoImgChange(){
    var AImageChange = $('.AInfoImage').val().substr(12);
    $('.AImage').attr('src',mainPath+'/resources/images/admin/'+AImageChange);
};
function AInfoImgRegi(){
    var AImageRegi = $('.AInfoImage2').val().substr(12);
    $('.AImgeRegi').attr('src',mainPath+'/resources/images/admin/'+AImageRegi);
};
//
// 구입TOP1
if ($('#memberPurchase1').length ){	
  var ctx = document.getElementById("memberPurchase1");
  var memberPurchase1 = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [{
        label: "매입TOP1",
        backgroundColor: "rgba(38, 185, 154, 0.31)",
        borderColor: "rgba(38, 185, 154, 0.7)",
        pointBorderColor: "rgba(38, 185, 154, 0.7)",
        pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
        pointHoverBackgroundColor: "#fff",
        pointHoverBorderColor: "rgba(220,220,220,1)",
        pointBorderWidth: 1,
        data: [31, 74, 6, 39, 20, 85, 107]
      }]
    },
  });
};
// 구입TOP2
if ($('#memberPurchase2').length ){	
  var ctx = document.getElementById("memberPurchase2");
  var memberPurchase2 = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [{
        label: "매입TOP1",
        backgroundColor: "rgba(38, 185, 154, 0.31)",
        borderColor: "rgba(38, 185, 154, 0.7)",
        pointBorderColor: "rgba(38, 185, 154, 0.7)",
        pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
        pointHoverBackgroundColor: "#fff",
        pointHoverBorderColor: "rgba(220,220,220,1)",
        pointBorderWidth: 1,
        data: [31, 74, 6, 39, 20, 85, 107]
      }]
    },
  });
};
// 구입TOP3
if ($('#memberPurchase3').length ){	
  var ctx = document.getElementById("memberPurchase3");
  var memberPurchase3 = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [{
        label: "매입TOP1",
        backgroundColor: "rgba(38, 185, 154, 0.31)",
        borderColor: "rgba(38, 185, 154, 0.7)",
        pointBorderColor: "rgba(38, 185, 154, 0.7)",
        pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
        pointHoverBackgroundColor: "#fff",
        pointHoverBorderColor: "rgba(220,220,220,1)",
        pointBorderWidth: 1,
        data: [31, 74, 6, 39, 20, 85, 107]
      }]
    },
  });
};
// 구입TOP4
if ($('#memberPurchase4').length ){	
  var ctx = document.getElementById("memberPurchase4");
  var memberPurchase4 = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [{
        label: "매입TOP1",
        backgroundColor: "rgba(38, 185, 154, 0.31)",
        borderColor: "rgba(38, 185, 154, 0.7)",
        pointBorderColor: "rgba(38, 185, 154, 0.7)",
        pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
        pointHoverBackgroundColor: "#fff",
        pointHoverBorderColor: "rgba(220,220,220,1)",
        pointBorderWidth: 1,
        data: [31, 74, 6, 39, 20, 85, 107]
      }]
    },
  });
};
// 구입TOP5
if ($('#memberPurchase5').length ){	
  var ctx = document.getElementById("memberPurchase5");
  var memberPurchase5 = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [{
        label: "매입TOP1",
        backgroundColor: "rgba(38, 185, 154, 0.31)",
        borderColor: "rgba(38, 185, 154, 0.7)",
        pointBorderColor: "rgba(38, 185, 154, 0.7)",
        pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
        pointHoverBackgroundColor: "#fff",
        pointHoverBorderColor: "rgba(220,220,220,1)",
        pointBorderWidth: 1,
        data: [31, 74, 6, 39, 20, 85, 107]
      }]
    },
  });
};
 // 구매TOP1  
if ($('#memberBuy1').length ){ 
  var ctx = document.getElementById("memberBuy1");
  var memberBuy1 = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [{
        label: '# of Votes',
        backgroundColor: "#26B99A",
        data: [51, 30, 40, 28, 92, 50, 45]
      }]
    }
  });
}; 
 // 구매TOP2
if ($('#memberBuy2').length ){ 
  var ctx = document.getElementById("memberBuy2");
  var memberBuy2 = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [{
        label: '# of Votes',
        backgroundColor: "#26B99A",
        data: [51, 30, 40, 28, 92, 50, 45]
      }]
    }
  });
}; 
 // 구매TOP3
if ($('#memberBuy3').length ){ 
  var ctx = document.getElementById("memberBuy3");
  var memberBuy3 = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [{
        label: '# of Votes',
        backgroundColor: "#26B99A",
        data: [51, 30, 40, 28, 92, 50, 45]
      }]
    }
  });
}; 
 // 구매TOP4
if ($('#memberBuy4').length ){ 
  var ctx = document.getElementById("memberBuy4");
  var memberBuy4 = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [{
        label: '# of Votes',
        backgroundColor: "#26B99A",
        data: [51, 30, 40, 28, 92, 50, 45]
      }]
    }
  });
}; 
 // 구매TOP5
if ($('#memberBuy5').length ){ 
  var ctx = document.getElementById("memberBuy5");
  var memberBuy5 = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [{
        label: '# of Votes',
        backgroundColor: "#26B99A",
        data: [51, 30, 40, 28, 92, 50, 45]
      }]
    }
  });
};
//방문/후기 통계
function init_morris_charts() {
    if( typeof (Morris) === 'undefined'){ return; }
    //방문TOP1
    if ($('#memberVisit1').length ){
        Morris.Line({
          element: 'memberVisit1',
          xkey: 'year',
          ykeys: ['value'],
          labels: ['Value'],
          hideHover: 'auto',
          lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          data: [
            {year: '2012', value: 10},
            {year: '2013', value: 1},
            {year: '2014', value: 5},
            {year: '2015', value: 5},
            {year: '2016', value: 10}
          ],
          resize: true
        });
        $('.panel-title').on('click', function() {
          $(window).resize();
        });
    }
    //방문TOP2
    if ($('#memberVisit2').length ){
        Morris.Line({
          element: 'memberVisit2',
          xkey: 'year',
          ykeys: ['value'],
          labels: ['Value'],
          hideHover: 'auto',
          lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          data: [
            {year: '2012', value: 10},
            {year: '2013', value: 1},
            {year: '2014', value: 5},
            {year: '2015', value: 5},
            {year: '2016', value: 10}
          ],
          resize: true
        });
        $('.panel-title').on('click', function() {
          $(window).resize();
        });
    }
    //방문TOP3
    if ($('#memberVisit3').length ){
        Morris.Line({
          element: 'memberVisit3',
          xkey: 'year',
          ykeys: ['value'],
          labels: ['Value'],
          hideHover: 'auto',
          lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          data: [
            {year: '2012', value: 10},
            {year: '2013', value: 1},
            {year: '2014', value: 5},
            {year: '2015', value: 5},
            {year: '2016', value: 10}
          ],
          resize: true
        });
        $('.panel-title').on('click', function() {
          $(window).resize();
        });
    }
    //방문TOP4
    if ($('#memberVisit4').length ){
        Morris.Line({
          element: 'memberVisit4',
          xkey: 'year',
          ykeys: ['value'],
          labels: ['Value'],
          hideHover: 'auto',
          lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          data: [
            {year: '2012', value: 10},
            {year: '2013', value: 1},
            {year: '2014', value: 5},
            {year: '2015', value: 5},
            {year: '2016', value: 10}
          ],
          resize: true
        });
        $('.panel-title').on('click', function() {
          $(window).resize();
        });
    }
    //방문TOP5
    if ($('#memberVisit5').length ){
        Morris.Line({
          element: 'memberVisit5',
          xkey: 'year',
          ykeys: ['value'],
          labels: ['Value'],
          hideHover: 'auto',
          lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          data: [
            {year: '2012', value: 10},
            {year: '2013', value: 1},
            {year: '2014', value: 5},
            {year: '2015', value: 5},
            {year: '2016', value: 10}
          ],
          resize: true
        });
        $('.panel-title').on('click', function() {
          $(window).resize();
        });
    }
    //후기TOP1
    if ($('#memberReply1').length ){
        Morris.Line({
          element: 'memberReply1',
          xkey: 'year',
          ykeys: ['value'],
          labels: ['Value'],
          hideHover: 'auto',
          lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          data: [
            {year: '2012', value: 10},
            {year: '2013', value: 1},
            {year: '2014', value: 5},
            {year: '2015', value: 5},
            {year: '2016', value: 10}
          ],
          resize: true
        });
        $('.panel-title').on('click', function() {
          $(window).resize();
        });
    }
    //후기TOP2
    if ($('#memberReply2').length ){
        Morris.Line({
          element: 'memberReply2',
          xkey: 'year',
          ykeys: ['value'],
          labels: ['Value'],
          hideHover: 'auto',
          lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          data: [
            {year: '2012', value: 10},
            {year: '2013', value: 1},
            {year: '2014', value: 5},
            {year: '2015', value: 5},
            {year: '2016', value: 10}
          ],
          resize: true
        });
        $('.panel-title').on('click', function() {
          $(window).resize();
        });
    }
    //휴기TOP3
    if ($('#memberReply3').length ){
        Morris.Line({
          element: 'memberReply3',
          xkey: 'year',
          ykeys: ['value'],
          labels: ['Value'],
          hideHover: 'auto',
          lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          data: [
            {year: '2012', value: 10},
            {year: '2013', value: 1},
            {year: '2014', value: 5},
            {year: '2015', value: 5},
            {year: '2016', value: 10}
          ],
          resize: true
        });
        $('.panel-title').on('click', function() {
          $(window).resize();
        });
    }
    //후기TOP4
    if ($('#memberReply4').length ){
        Morris.Line({
          element: 'memberReply4',
          xkey: 'year',
          ykeys: ['value'],
          labels: ['Value'],
          hideHover: 'auto',
          lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          data: [
            {year: '2012', value: 10},
            {year: '2013', value: 1},
            {year: '2014', value: 5},
            {year: '2015', value: 5},
            {year: '2016', value: 10}
          ],
          resize: true
        });
        $('.panel-title').on('click', function() {
          $(window).resize();
        });
    }
    //후기TOP5
    if ($('#memberReply5').length ){
        Morris.Line({
          element: 'memberReply5',
          xkey: 'year',
          ykeys: ['value'],
          labels: ['Value'],
          hideHover: 'auto',
          lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          data: [
            {year: '2012', value: 10},
            {year: '2013', value: 1},
            {year: '2014', value: 5},
            {year: '2015', value: 5},
            {year: '2016', value: 10}
          ],
          resize: true
        });
        $('.panel-title').on('click', function() {
          $(window).resize();
        });
    }
};
//매출/판매상품 통계
function init_charts() {
    if( typeof (Chart) === 'undefined'){ return; }
    Chart.defaults.global.legend = {enabled: false};
    //매출상품TOP1
    if ($('#sellProduct1').length ){
      var ctx = document.getElementById("sellProduct1");
      var sellProduct1 = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: '# of Votes',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 45]
          }, {
            label: '# of Votes',
            backgroundColor: "#03586A",
            data: [41, 56, 25, 48, 72, 34, 12]
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }
    //매출상품TOP2
    if ($('#sellProduct2').length ){
      var ctx = document.getElementById("sellProduct2");
      var sellProduct2 = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: '# of Votes',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 45]
          }, {
            label: '# of Votes',
            backgroundColor: "#03586A",
            data: [41, 56, 25, 48, 72, 34, 12]
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }
    //매출상품TOP3
    if ($('#sellProduct3').length ){
      var ctx = document.getElementById("sellProduct3");
      var sellProduct3 = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: '# of Votes',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 45]
          }, {
            label: '# of Votes',
            backgroundColor: "#03586A",
            data: [41, 56, 25, 48, 72, 34, 12]
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }
    //매출상품TOP4
    if ($('#sellProduct4').length ){
      var ctx = document.getElementById("sellProduct4");
      var sellProduct4 = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: '# of Votes',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 45]
          }, {
            label: '# of Votes',
            backgroundColor: "#03586A",
            data: [41, 56, 25, 48, 72, 34, 12]
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }
    //매출상품TOP5
    if ($('#sellProduct5').length ){
      var ctx = document.getElementById("sellProduct5");
      var sellProduct5 = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: '# of Votes',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 45]
          }, {
            label: '# of Votes',
            backgroundColor: "#03586A",
            data: [41, 56, 25, 48, 72, 34, 12]
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }
    //판매상품TOP1
    if ($('#merchandiseProduct1').length ){
      var ctx = document.getElementById("merchandiseProduct1");
      var merchandiseProduct1 = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: '# of Votes',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 45]
          }, {
            label: '# of Votes',
            backgroundColor: "#03586A",
            data: [41, 56, 25, 48, 72, 34, 12]
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }
    //판매상품TOP2
    if ($('#merchandiseProduct2').length ){
      var ctx = document.getElementById("merchandiseProduct2");
      var merchandiseProduct2 = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: '# of Votes',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 45]
          }, {
            label: '# of Votes',
            backgroundColor: "#03586A",
            data: [41, 56, 25, 48, 72, 34, 12]
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }
    //판매상품TOP3
    if ($('#merchandiseProduct3').length ){
      var ctx = document.getElementById("merchandiseProduct3");
      var merchandiseProduct3 = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: '# of Votes',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 45]
          }, {
            label: '# of Votes',
            backgroundColor: "#03586A",
            data: [41, 56, 25, 48, 72, 34, 12]
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }
    //판매상품TOP4
    if ($('#merchandiseProduct4').length ){
      var ctx = document.getElementById("merchandiseProduct4");
      var merchandiseProduct4 = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: '# of Votes',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 45]
          }, {
            label: '# of Votes',
            backgroundColor: "#03586A",
            data: [41, 56, 25, 48, 72, 34, 12]
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }
    //판매상품TOP5
    if ($('#merchandiseProduct5').length ){
      var ctx = document.getElementById("merchandiseProduct5");
      var merchandiseProduct5 = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: '# of Votes',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 45]
          }, {
            label: '# of Votes',
            backgroundColor: "#03586A",
            data: [41, 56, 25, 48, 72, 34, 12]
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }
    //별점상품TOP1
    if ($('#starProduct1').length ){	
      var ctx = document.getElementById("starProduct1");
      var starProduct1 = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: "My First dataset",
            backgroundColor: "rgba(38, 185, 154, 0.31)",
            borderColor: "rgba(38, 185, 154, 0.7)",
            pointBorderColor: "rgba(38, 185, 154, 0.7)",
            pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointBorderWidth: 1,
            data: [31, 74, 6, 39, 20, 85, 7]
          }, {
            label: "My Second dataset",
            backgroundColor: "rgba(3, 88, 106, 0.3)",
            borderColor: "rgba(3, 88, 106, 0.70)",
            pointBorderColor: "rgba(3, 88, 106, 0.70)",
            pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(151,187,205,1)",
            pointBorderWidth: 1,
            data: [82, 23, 66, 9, 99, 4, 2]
          }]
        },
      });
    }
    //별점상품TOP2
    if ($('#starProduct2').length ){	
      var ctx = document.getElementById("starProduct2");
      var starProduct2 = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: "My First dataset",
            backgroundColor: "rgba(38, 185, 154, 0.31)",
            borderColor: "rgba(38, 185, 154, 0.7)",
            pointBorderColor: "rgba(38, 185, 154, 0.7)",
            pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointBorderWidth: 1,
            data: [31, 74, 6, 39, 20, 85, 7]
          }, {
            label: "My Second dataset",
            backgroundColor: "rgba(3, 88, 106, 0.3)",
            borderColor: "rgba(3, 88, 106, 0.70)",
            pointBorderColor: "rgba(3, 88, 106, 0.70)",
            pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(151,187,205,1)",
            pointBorderWidth: 1,
            data: [82, 23, 66, 9, 99, 4, 2]
          }]
        },
      });
    }
    //별점상품TOP3
    if ($('#starProduct3').length ){	
      var ctx = document.getElementById("starProduct3");
      var starProduct3 = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: "My First dataset",
            backgroundColor: "rgba(38, 185, 154, 0.31)",
            borderColor: "rgba(38, 185, 154, 0.7)",
            pointBorderColor: "rgba(38, 185, 154, 0.7)",
            pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointBorderWidth: 1,
            data: [31, 74, 6, 39, 20, 85, 7]
          }, {
            label: "My Second dataset",
            backgroundColor: "rgba(3, 88, 106, 0.3)",
            borderColor: "rgba(3, 88, 106, 0.70)",
            pointBorderColor: "rgba(3, 88, 106, 0.70)",
            pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(151,187,205,1)",
            pointBorderWidth: 1,
            data: [82, 23, 66, 9, 99, 4, 2]
          }]
        },
      });
    }
    //별점상품TOP4
    if ($('#starProduct4').length ){	
      var ctx = document.getElementById("starProduct4");
      var starProduct4 = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: "My First dataset",
            backgroundColor: "rgba(38, 185, 154, 0.31)",
            borderColor: "rgba(38, 185, 154, 0.7)",
            pointBorderColor: "rgba(38, 185, 154, 0.7)",
            pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointBorderWidth: 1,
            data: [31, 74, 6, 39, 20, 85, 7]
          }, {
            label: "My Second dataset",
            backgroundColor: "rgba(3, 88, 106, 0.3)",
            borderColor: "rgba(3, 88, 106, 0.70)",
            pointBorderColor: "rgba(3, 88, 106, 0.70)",
            pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(151,187,205,1)",
            pointBorderWidth: 1,
            data: [82, 23, 66, 9, 99, 4, 2]
          }]
        },
      });
    }
    //별점상품TOP5
    if ($('#starProduct5').length ){	
      var ctx = document.getElementById("starProduct5");
      var starProduct5 = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: "My First dataset",
            backgroundColor: "rgba(38, 185, 154, 0.31)",
            borderColor: "rgba(38, 185, 154, 0.7)",
            pointBorderColor: "rgba(38, 185, 154, 0.7)",
            pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointBorderWidth: 1,
            data: [31, 74, 6, 39, 20, 85, 7]
          }, {
            label: "My Second dataset",
            backgroundColor: "rgba(3, 88, 106, 0.3)",
            borderColor: "rgba(3, 88, 106, 0.70)",
            pointBorderColor: "rgba(3, 88, 106, 0.70)",
            pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(151,187,205,1)",
            pointBorderWidth: 1,
            data: [82, 23, 66, 9, 99, 4, 2]
          }]
        },
      });
    }
    //조회상품TOP1
    if ($('#clickProduct1').length ){	
      var ctx = document.getElementById("clickProduct1");
      var clickProduct1 = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: "My First dataset",
            backgroundColor: "rgba(38, 185, 154, 0.31)",
            borderColor: "rgba(38, 185, 154, 0.7)",
            pointBorderColor: "rgba(38, 185, 154, 0.7)",
            pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointBorderWidth: 1,
            data: [31, 74, 6, 39, 20, 85, 7]
          }, {
            label: "My Second dataset",
            backgroundColor: "rgba(3, 88, 106, 0.3)",
            borderColor: "rgba(3, 88, 106, 0.70)",
            pointBorderColor: "rgba(3, 88, 106, 0.70)",
            pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(151,187,205,1)",
            pointBorderWidth: 1,
            data: [82, 23, 66, 9, 99, 4, 2]
          }]
        },
      });
    }
    //조회상품TOP2
    if ($('#clickProduct2').length ){	
      var ctx = document.getElementById("clickProduct2");
      var clickProduct2 = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: "My First dataset",
            backgroundColor: "rgba(38, 185, 154, 0.31)",
            borderColor: "rgba(38, 185, 154, 0.7)",
            pointBorderColor: "rgba(38, 185, 154, 0.7)",
            pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointBorderWidth: 1,
            data: [31, 74, 6, 39, 20, 85, 7]
          }, {
            label: "My Second dataset",
            backgroundColor: "rgba(3, 88, 106, 0.3)",
            borderColor: "rgba(3, 88, 106, 0.70)",
            pointBorderColor: "rgba(3, 88, 106, 0.70)",
            pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(151,187,205,1)",
            pointBorderWidth: 1,
            data: [82, 23, 66, 9, 99, 4, 2]
          }]
        },
      });
    }
    //조회상품TOP3
    if ($('#clickProduct3').length ){	
      var ctx = document.getElementById("clickProduct3");
      var clickProduct3 = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: "My First dataset",
            backgroundColor: "rgba(38, 185, 154, 0.31)",
            borderColor: "rgba(38, 185, 154, 0.7)",
            pointBorderColor: "rgba(38, 185, 154, 0.7)",
            pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointBorderWidth: 1,
            data: [31, 74, 6, 39, 20, 85, 7]
          }, {
            label: "My Second dataset",
            backgroundColor: "rgba(3, 88, 106, 0.3)",
            borderColor: "rgba(3, 88, 106, 0.70)",
            pointBorderColor: "rgba(3, 88, 106, 0.70)",
            pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(151,187,205,1)",
            pointBorderWidth: 1,
            data: [82, 23, 66, 9, 99, 4, 2]
          }]
        },
      });
    }
    //조회상품TOP4
    if ($('#clickProduct4').length ){	
      var ctx = document.getElementById("clickProduct4");
      var clickProduct4 = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: "My First dataset",
            backgroundColor: "rgba(38, 185, 154, 0.31)",
            borderColor: "rgba(38, 185, 154, 0.7)",
            pointBorderColor: "rgba(38, 185, 154, 0.7)",
            pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointBorderWidth: 1,
            data: [31, 74, 6, 39, 20, 85, 7]
          }, {
            label: "My Second dataset",
            backgroundColor: "rgba(3, 88, 106, 0.3)",
            borderColor: "rgba(3, 88, 106, 0.70)",
            pointBorderColor: "rgba(3, 88, 106, 0.70)",
            pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(151,187,205,1)",
            pointBorderWidth: 1,
            data: [82, 23, 66, 9, 99, 4, 2]
          }]
        },
      });
    }
    //조회상품TOP5
    if ($('#clickProduct5').length ){	
      var ctx = document.getElementById("clickProduct5");
      var clickProduct5 = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [{
            label: "My First dataset",
            backgroundColor: "rgba(38, 185, 154, 0.31)",
            borderColor: "rgba(38, 185, 154, 0.7)",
            pointBorderColor: "rgba(38, 185, 154, 0.7)",
            pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointBorderWidth: 1,
            data: [31, 74, 6, 39, 20, 85, 7]
          }, {
            label: "My Second dataset",
            backgroundColor: "rgba(3, 88, 106, 0.3)",
            borderColor: "rgba(3, 88, 106, 0.70)",
            pointBorderColor: "rgba(3, 88, 106, 0.70)",
            pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(151,187,205,1)",
            pointBorderWidth: 1,
            data: [82, 23, 66, 9, 99, 4, 2]
          }]
        },
      });
    }
};
//기타통계
function init_echarts() {
        if( typeof (echarts) === 'undefined'){ return; }
          var theme = {
          color: [
              '#26B99A', '#34495E', '#BDC3C7', '#3498DB',
              '#9B59B6', '#8abb6f', '#759c6a', '#bfd3b7'
          ],

          title: {
              itemGap: 8,
              textStyle: {
                  fontWeight: 'normal',
                  color: '#408829'
              }
          },

          dataRange: {
              color: ['#1f610a', '#97b58d']
          },

          toolbox: {
              color: ['#408829', '#408829', '#408829', '#408829']
          },

          tooltip: {
              backgroundColor: 'rgba(0,0,0,0.5)',
              axisPointer: {
                  type: 'line',
                  lineStyle: {
                      color: '#408829',
                      type: 'dashed'
                  },
                  crossStyle: {
                      color: '#408829'
                  },
                  shadowStyle: {
                      color: 'rgba(200,200,200,0.3)'
                  }
              }
          },

          dataZoom: {
              dataBackgroundColor: '#eee',
              fillerColor: 'rgba(64,136,41,0.2)',
              handleColor: '#408829'
          },
          grid: {
              borderWidth: 0
          },

          categoryAxis: {
              axisLine: {
                  lineStyle: {
                      color: '#408829'
                  }
              },
              splitLine: {
                  lineStyle: {
                      color: ['#eee']
                  }
              }
          },

          valueAxis: {
              axisLine: {
                  lineStyle: {
                      color: '#408829'
                  }
              },
              splitArea: {
                  show: true,
                  areaStyle: {
                      color: ['rgba(250,250,250,0.1)', 'rgba(200,200,200,0.1)']
                  }
              },
              splitLine: {
                  lineStyle: {
                      color: ['#eee']
                  }
              }
          },
          timeline: {
              lineStyle: {
                  color: '#408829'
              },
              controlStyle: {
                  normal: {color: '#408829'},
                  emphasis: {color: '#408829'}
              }
          },

          k: {
              itemStyle: {
                  normal: {
                      color: '#68a54a',
                      color0: '#a9cba2',
                      lineStyle: {
                          width: 1,
                          color: '#408829',
                          color0: '#86b379'
                      }
                  }
              }
          },
          map: {
              itemStyle: {
                  normal: {
                      areaStyle: {
                          color: '#ddd'
                      },
                      label: {
                          textStyle: {
                              color: '#c12e34'
                          }
                      }
                  },
                  emphasis: {
                      areaStyle: {
                          color: '#99d2dd'
                      },
                      label: {
                          textStyle: {
                              color: '#c12e34'
                          }
                      }
                  }
              }
          },
          force: {
              itemStyle: {
                  normal: {
                      linkStyle: {
                          strokeColor: '#408829'
                      }
                  }
              }
          },
          chord: {
              padding: 4,
              itemStyle: {
                  normal: {
                      lineStyle: {
                          width: 1,
                          color: 'rgba(128, 128, 128, 0.5)'
                      },
                      chordStyle: {
                          lineStyle: {
                              width: 1,
                              color: 'rgba(128, 128, 128, 0.5)'
                          }
                      }
                  },
                  emphasis: {
                      lineStyle: {
                          width: 1,
                          color: 'rgba(128, 128, 128, 0.5)'
                      },
                      chordStyle: {
                          lineStyle: {
                              width: 1,
                              color: 'rgba(128, 128, 128, 0.5)'
                          }
                      }
                  }
              }
          },
          gauge: {
              startAngle: 225,
              endAngle: -45,
              axisLine: {
                  show: true,
                  lineStyle: {
                      color: [[0.2, '#86b379'], [0.8, '#68a54a'], [1, '#408829']],
                      width: 8
                  }
              },
              axisTick: {
                  splitNumber: 10,
                  length: 12,
                  lineStyle: {
                      color: 'auto'
                  }
              },
              axisLabel: {
                  textStyle: {
                      color: 'auto'
                  }
              },
              splitLine: {
                  length: 18,
                  lineStyle: {
                      color: 'auto'
                  }
              },
              pointer: {
                  length: '90%',
                  color: 'auto'
              },
              title: {
                  textStyle: {
                      color: '#333'
                  }
              },
              detail: {
                  textStyle: {
                      color: 'auto'
                  }
              }
          },
          textStyle: {
              fontFamily: 'Arial, Verdana, sans-serif'
          }
      };

    //연령별회원비율
    if ($('#ageRate').length ){

          var echartBar = echarts.init(document.getElementById('ageRate'), theme);

          echartBar.setOption({
            title: {
              text: 'Graph title',
              subtext: 'Graph Sub-text'
            },
            tooltip: {
              trigger: 'axis'
            },
            legend: {
              data: ['sales', 'purchases']
            },
            toolbox: {
              show: false
            },
            calculable: false,
            xAxis: [{
              type: 'category',
              data: ['1?', '2?', '3?', '4?', '5?', '6?', '7?', '8?', '9?', '10?', '11?', '12?']
            }],
            yAxis: [{
              type: 'value'
            }],
            series: [{
              name: 'sales',
              type: 'bar',
              data: [2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
              markPoint: {
                data: [{
                  type: 'max',
                  name: '???'
                }, {
                  type: 'min',
                  name: '???'
                }]
              },
              markLine: {
                data: [{
                  type: 'average',
                  name: '???'
                }]
              }
            }, {
              name: 'purchases',
              type: 'bar',
              data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
              markPoint: {
                data: [{
                  name: 'sales',
                  value: 182.2,
                  xAxis: 7,
                  yAxis: 183,
                }, {
                  name: 'purchases',
                  value: 2.3,
                  xAxis: 11,
                  yAxis: 3
                }]
              },
              markLine: {
                data: [{
                  type: 'average',
                  name: '???'
                }]
              }
            }]
          });

    }

    //시간별방문/구매분포
    if ($('#timeBuyRate').length ){ 

      var echartScatter = echarts.init(document.getElementById('timeBuyRate'), theme);

      echartScatter.setOption({
        title: {
          text: 'Scatter Graph',
          subtext: 'Heinz  2003'
        },
        tooltip: {
          trigger: 'axis',
          showDelay: 0,
          axisPointer: {
            type: 'cross',
            lineStyle: {
              type: 'dashed',
              width: 1
            }
          }
        },
        legend: {
          data: ['Data2', 'Data1']
        },
        toolbox: {
          show: true,
          feature: {
            saveAsImage: {
              show: true,
              title: "Save Image"
            }
          }
        },
        xAxis: [{
          type: 'value',
          scale: true,
          axisLabel: {
            formatter: '{value} cm'
          }
        }],
        yAxis: [{
          type: 'value',
          scale: true,
          axisLabel: {
            formatter: '{value} kg'
          }
        }],
        series: [{
          name: 'Data1',
          type: 'scatter',
          tooltip: {
            trigger: 'item',
            formatter: function(params) {
              if (params.value.length > 1) {
                return params.seriesName + ' :<br/>' + params.value[0] + 'cm ' + params.value[1] + 'kg ';
              } else {
                return params.seriesName + ' :<br/>' + params.name + ' : ' + params.value + 'kg ';
              }
            }
          },
          data: [
            [161.2, 51.6],
            [167.5, 59.0],
            [159.5, 49.2],
            [157.0, 63.0],
            [155.8, 53.6],
            [170.0, 59.0],
            [159.1, 47.6],
            [166.0, 69.8],
            [176.2, 66.8],
            [160.2, 75.2],
            [172.5, 55.2],
            [170.9, 54.2],
            [172.9, 62.5],
            [153.4, 42.0],
            [160.0, 50.0],
            [147.2, 49.8],
            [168.2, 49.2],
            [175.0, 73.2],
            [157.0, 47.8],
            [167.6, 68.8],
            [159.5, 50.6],
            [175.0, 82.5],
            [166.8, 57.2],
            [176.5, 87.8],
            [170.2, 72.8],
            [174.0, 54.5],
            [173.0, 59.8],
            [179.9, 67.3],
            [170.5, 67.8],
            [160.0, 47.0],
            [154.4, 46.2],
            [162.0, 55.0],
            [176.5, 83.0],
            [160.0, 54.4],
            [152.0, 45.8],
            [162.1, 53.6],
            [170.0, 73.2],
            [160.2, 52.1],
            [161.3, 67.9],
            [166.4, 56.6],
            [168.9, 62.3],
            [163.8, 58.5],
            [167.6, 54.5],
            [160.0, 50.2],
            [161.3, 60.3],
            [167.6, 58.3],
            [165.1, 56.2],
            [160.0, 50.2],
            [170.0, 72.9],
            [157.5, 59.8],
            [167.6, 61.0],
            [160.7, 69.1],
            [163.2, 55.9],
            [152.4, 46.5],
            [157.5, 54.3],
            [168.3, 54.8],
            [180.3, 60.7],
            [165.5, 60.0],
            [165.0, 62.0],
            [164.5, 60.3],
            [156.0, 52.7],
            [160.0, 74.3],
            [163.0, 62.0],
            [165.7, 73.1],
            [161.0, 80.0],
            [162.0, 54.7],
            [166.0, 53.2],
            [174.0, 75.7],
            [172.7, 61.1],
            [167.6, 55.7],
            [151.1, 48.7],
            [164.5, 52.3],
            [163.5, 50.0],
            [152.0, 59.3],
            [169.0, 62.5],
            [164.0, 55.7],
            [161.2, 54.8],
            [155.0, 45.9],
            [170.0, 70.6],
            [176.2, 67.2],
            [170.0, 69.4],
            [162.5, 58.2],
            [170.3, 64.8],
            [164.1, 71.6],
            [169.5, 52.8],
            [163.2, 59.8],
            [154.5, 49.0],
            [159.8, 50.0],
            [173.2, 69.2],
            [170.0, 55.9],
            [161.4, 63.4],
            [169.0, 58.2],
            [166.2, 58.6],
            [159.4, 45.7],
            [162.5, 52.2],
            [159.0, 48.6],
            [162.8, 57.8],
            [159.0, 55.6],
            [179.8, 66.8],
            [162.9, 59.4],
            [161.0, 53.6],
            [151.1, 73.2],
            [168.2, 53.4],
            [168.9, 69.0],
            [173.2, 58.4],
            [171.8, 56.2],
            [178.0, 70.6],
            [164.3, 59.8],
            [163.0, 72.0],
            [168.5, 65.2],
            [166.8, 56.6],
            [172.7, 105.2],
            [163.5, 51.8],
            [169.4, 63.4],
            [167.8, 59.0],
            [159.5, 47.6],
            [167.6, 63.0],
            [161.2, 55.2],
            [160.0, 45.0],
            [163.2, 54.0],
            [162.2, 50.2],
            [161.3, 60.2],
            [149.5, 44.8],
            [157.5, 58.8],
            [163.2, 56.4],
            [172.7, 62.0],
            [155.0, 49.2],
            [156.5, 67.2],
            [164.0, 53.8],
            [160.9, 54.4],
            [162.8, 58.0],
            [167.0, 59.8],
            [160.0, 54.8],
            [160.0, 43.2],
            [168.9, 60.5],
            [158.2, 46.4],
            [156.0, 64.4],
            [160.0, 48.8],
            [167.1, 62.2],
            [158.0, 55.5],
            [167.6, 57.8],
            [156.0, 54.6],
            [162.1, 59.2],
            [173.4, 52.7],
            [159.8, 53.2],
            [170.5, 64.5],
            [159.2, 51.8],
            [157.5, 56.0],
            [161.3, 63.6],
            [162.6, 63.2],
            [160.0, 59.5],
            [168.9, 56.8],
            [165.1, 64.1],
            [162.6, 50.0],
            [165.1, 72.3],
            [166.4, 55.0],
            [160.0, 55.9],
            [152.4, 60.4],
            [170.2, 69.1],
            [162.6, 84.5],
            [170.2, 55.9],
            [158.8, 55.5],
            [172.7, 69.5],
            [167.6, 76.4],
            [162.6, 61.4],
            [167.6, 65.9],
            [156.2, 58.6],
            [175.2, 66.8],
            [172.1, 56.6],
            [162.6, 58.6],
            [160.0, 55.9],
            [165.1, 59.1],
            [182.9, 81.8],
            [166.4, 70.7],
            [165.1, 56.8],
            [177.8, 60.0],
            [165.1, 58.2],
            [175.3, 72.7],
            [154.9, 54.1],
            [158.8, 49.1],
            [172.7, 75.9],
            [168.9, 55.0],
            [161.3, 57.3],
            [167.6, 55.0],
            [165.1, 65.5],
            [175.3, 65.5],
            [157.5, 48.6],
            [163.8, 58.6],
            [167.6, 63.6],
            [165.1, 55.2],
            [165.1, 62.7],
            [168.9, 56.6],
            [162.6, 53.9],
            [164.5, 63.2],
            [176.5, 73.6],
            [168.9, 62.0],
            [175.3, 63.6],
            [159.4, 53.2],
            [160.0, 53.4],
            [170.2, 55.0],
            [162.6, 70.5],
            [167.6, 54.5],
            [162.6, 54.5],
            [160.7, 55.9],
            [160.0, 59.0],
            [157.5, 63.6],
            [162.6, 54.5],
            [152.4, 47.3],
            [170.2, 67.7],
            [165.1, 80.9],
            [172.7, 70.5],
            [165.1, 60.9],
            [170.2, 63.6],
            [170.2, 54.5],
            [170.2, 59.1],
            [161.3, 70.5],
            [167.6, 52.7],
            [167.6, 62.7],
            [165.1, 86.3],
            [162.6, 66.4],
            [152.4, 67.3],
            [168.9, 63.0],
            [170.2, 73.6],
            [175.2, 62.3],
            [175.2, 57.7],
            [160.0, 55.4],
            [165.1, 104.1],
            [174.0, 55.5],
            [170.2, 77.3],
            [160.0, 80.5],
            [167.6, 64.5],
            [167.6, 72.3],
            [167.6, 61.4],
            [154.9, 58.2],
            [162.6, 81.8],
            [175.3, 63.6],
            [171.4, 53.4],
            [157.5, 54.5],
            [165.1, 53.6],
            [160.0, 60.0],
            [174.0, 73.6],
            [162.6, 61.4],
            [174.0, 55.5],
            [162.6, 63.6],
            [161.3, 60.9],
            [156.2, 60.0],
            [149.9, 46.8],
            [169.5, 57.3],
            [160.0, 64.1],
            [175.3, 63.6],
            [169.5, 67.3],
            [160.0, 75.5],
            [172.7, 68.2],
            [162.6, 61.4],
            [157.5, 76.8],
            [176.5, 71.8],
            [164.4, 55.5],
            [160.7, 48.6],
            [174.0, 66.4],
            [163.8, 67.3]
          ],
          markPoint: {
            data: [{
              type: 'max',
              name: 'Max'
            }, {
              type: 'min',
              name: 'Min'
            }]
          },
          markLine: {
            data: [{
              type: 'average',
              name: 'Mean'
            }]
          }
        }, {
          name: 'Data2',
          type: 'scatter',
          tooltip: {
            trigger: 'item',
            formatter: function(params) {
              if (params.value.length > 1) {
                return params.seriesName + ' :<br/>' + params.value[0] + 'cm ' + params.value[1] + 'kg ';
              } else {
                return params.seriesName + ' :<br/>' + params.name + ' : ' + params.value + 'kg ';
              }
            }
          },
          data: [
            [174.0, 65.6],
            [175.3, 71.8],
            [193.5, 80.7],
            [186.5, 72.6],
            [187.2, 78.8],
            [181.5, 74.8],
            [184.0, 86.4],
            [184.5, 78.4],
            [175.0, 62.0],
            [184.0, 81.6],
            [180.0, 76.6],
            [177.8, 83.6],
            [192.0, 90.0],
            [176.0, 74.6],
            [174.0, 71.0],
            [184.0, 79.6],
            [192.7, 93.8],
            [171.5, 70.0],
            [173.0, 72.4],
            [176.0, 85.9],
            [176.0, 78.8],
            [180.5, 77.8],
            [172.7, 66.2],
            [176.0, 86.4],
            [173.5, 81.8],
            [178.0, 89.6],
            [180.3, 82.8],
            [180.3, 76.4],
            [164.5, 63.2],
            [173.0, 60.9],
            [183.5, 74.8],
            [175.5, 70.0],
            [188.0, 72.4],
            [189.2, 84.1],
            [172.8, 69.1],
            [170.0, 59.5],
            [182.0, 67.2],
            [170.0, 61.3],
            [177.8, 68.6],
            [184.2, 80.1],
            [186.7, 87.8],
            [171.4, 84.7],
            [172.7, 73.4],
            [175.3, 72.1],
            [180.3, 82.6],
            [182.9, 88.7],
            [188.0, 84.1],
            [177.2, 94.1],
            [172.1, 74.9],
            [167.0, 59.1],
            [169.5, 75.6],
            [174.0, 86.2],
            [172.7, 75.3],
            [182.2, 87.1],
            [164.1, 55.2],
            [163.0, 57.0],
            [171.5, 61.4],
            [184.2, 76.8],
            [174.0, 86.8],
            [174.0, 72.2],
            [177.0, 71.6],
            [186.0, 84.8],
            [167.0, 68.2],
            [171.8, 66.1],
            [182.0, 72.0],
            [167.0, 64.6],
            [177.8, 74.8],
            [164.5, 70.0],
            [192.0, 101.6],
            [175.5, 63.2],
            [171.2, 79.1],
            [181.6, 78.9],
            [167.4, 67.7],
            [181.1, 66.0],
            [177.0, 68.2],
            [174.5, 63.9],
            [177.5, 72.0],
            [170.5, 56.8],
            [182.4, 74.5],
            [197.1, 90.9],
            [180.1, 93.0],
            [175.5, 80.9],
            [180.6, 72.7],
            [184.4, 68.0],
            [175.5, 70.9],
            [180.6, 72.5],
            [177.0, 72.5],
            [177.1, 83.4],
            [181.6, 75.5],
            [176.5, 73.0],
            [175.0, 70.2],
            [174.0, 73.4],
            [165.1, 70.5],
            [177.0, 68.9],
            [192.0, 102.3],
            [176.5, 68.4],
            [169.4, 65.9],
            [182.1, 75.7],
            [179.8, 84.5],
            [175.3, 87.7],
            [184.9, 86.4],
            [177.3, 73.2],
            [167.4, 53.9],
            [178.1, 72.0],
            [168.9, 55.5],
            [157.2, 58.4],
            [180.3, 83.2],
            [170.2, 72.7],
            [177.8, 64.1],
            [172.7, 72.3],
            [165.1, 65.0],
            [186.7, 86.4],
            [165.1, 65.0],
            [174.0, 88.6],
            [175.3, 84.1],
            [185.4, 66.8],
            [177.8, 75.5],
            [180.3, 93.2],
            [180.3, 82.7],
            [177.8, 58.0],
            [177.8, 79.5],
            [177.8, 78.6],
            [177.8, 71.8],
            [177.8, 116.4],
            [163.8, 72.2],
            [188.0, 83.6],
            [198.1, 85.5],
            [175.3, 90.9],
            [166.4, 85.9],
            [190.5, 89.1],
            [166.4, 75.0],
            [177.8, 77.7],
            [179.7, 86.4],
            [172.7, 90.9],
            [190.5, 73.6],
            [185.4, 76.4],
            [168.9, 69.1],
            [167.6, 84.5],
            [175.3, 64.5],
            [170.2, 69.1],
            [190.5, 108.6],
            [177.8, 86.4],
            [190.5, 80.9],
            [177.8, 87.7],
            [184.2, 94.5],
            [176.5, 80.2],
            [177.8, 72.0],
            [180.3, 71.4],
            [171.4, 72.7],
            [172.7, 84.1],
            [172.7, 76.8],
            [177.8, 63.6],
            [177.8, 80.9],
            [182.9, 80.9],
            [170.2, 85.5],
            [167.6, 68.6],
            [175.3, 67.7],
            [165.1, 66.4],
            [185.4, 102.3],
            [181.6, 70.5],
            [172.7, 95.9],
            [190.5, 84.1],
            [179.1, 87.3],
            [175.3, 71.8],
            [170.2, 65.9],
            [193.0, 95.9],
            [171.4, 91.4],
            [177.8, 81.8],
            [177.8, 96.8],
            [167.6, 69.1],
            [167.6, 82.7],
            [180.3, 75.5],
            [182.9, 79.5],
            [176.5, 73.6],
            [186.7, 91.8],
            [188.0, 84.1],
            [188.0, 85.9],
            [177.8, 81.8],
            [174.0, 82.5],
            [177.8, 80.5],
            [171.4, 70.0],
            [185.4, 81.8],
            [185.4, 84.1],
            [188.0, 90.5],
            [188.0, 91.4],
            [182.9, 89.1],
            [176.5, 85.0],
            [175.3, 69.1],
            [175.3, 73.6],
            [188.0, 80.5],
            [188.0, 82.7],
            [175.3, 86.4],
            [170.5, 67.7],
            [179.1, 92.7],
            [177.8, 93.6],
            [175.3, 70.9],
            [182.9, 75.0],
            [170.8, 93.2],
            [188.0, 93.2],
            [180.3, 77.7],
            [177.8, 61.4],
            [185.4, 94.1],
            [168.9, 75.0],
            [185.4, 83.6],
            [180.3, 85.5],
            [174.0, 73.9],
            [167.6, 66.8],
            [182.9, 87.3],
            [160.0, 72.3],
            [180.3, 88.6],
            [167.6, 75.5],
            [186.7, 101.4],
            [175.3, 91.1],
            [175.3, 67.3],
            [175.9, 77.7],
            [175.3, 81.8],
            [179.1, 75.5],
            [181.6, 84.5],
            [177.8, 76.6],
            [182.9, 85.0],
            [177.8, 102.5],
            [184.2, 77.3],
            [179.1, 71.8],
            [176.5, 87.9],
            [188.0, 94.3],
            [174.0, 70.9],
            [167.6, 64.5],
            [170.2, 77.3],
            [167.6, 72.3],
            [188.0, 87.3],
            [174.0, 80.0],
            [176.5, 82.3],
            [180.3, 73.6],
            [167.6, 74.1],
            [188.0, 85.9],
            [180.3, 73.2],
            [167.6, 76.3],
            [183.0, 65.9],
            [183.0, 90.9],
            [179.1, 89.1],
            [170.2, 62.3],
            [177.8, 82.7],
            [179.1, 79.1],
            [190.5, 98.2],
            [177.8, 84.1],
            [180.3, 83.2],
            [180.3, 83.2]
          ],
          markPoint: {
            data: [{
              type: 'max',
              name: 'Max'
            }, {
              type: 'min',
              name: 'Min'
            }]
          },
          markLine: {
            data: [{
              type: 'average',
              name: 'Mean'
            }]
          }
        }]
      });

    } 

    //성별회원비율
    if ($('#genderRate').length ){  

      var echartDonut = echarts.init(document.getElementById('genderRate'), theme);

      echartDonut.setOption({
        tooltip: {
          trigger: 'item',
          formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        calculable: true,
        legend: {
          x: 'center',
          y: 'bottom',
          data: ['Direct Access', 'E-mail Marketing', 'Union Ad', 'Video Ads', 'Search Engine']
        },
        toolbox: {
          show: true,
          feature: {
            magicType: {
              show: true,
              type: ['pie', 'funnel'],
              option: {
                funnel: {
                  x: '25%',
                  width: '50%',
                  funnelAlign: 'center',
                  max: 1548
                }
              }
            },
            restore: {
              show: true,
              title: "Restore"
            },
            saveAsImage: {
              show: true,
              title: "Save Image"
            }
          }
        },
        series: [{
          name: 'Access to the resource',
          type: 'pie',
          radius: ['35%', '55%'],
          itemStyle: {
            normal: {
              label: {
                show: true
              },
              labelLine: {
                show: true
              }
            },
            emphasis: {
              label: {
                show: true,
                position: 'center',
                textStyle: {
                  fontSize: '14',
                  fontWeight: 'normal'
                }
              }
            }
          },
          data: [{
            value: 335,
            name: 'Direct Access'
          }, {
            value: 310,
            name: 'E-mail Marketing'
          }, {
            value: 234,
            name: 'Union Ad'
          }, {
            value: 135,
            name: 'Video Ads'
          }, {
            value: 1548,
            name: 'Search Engine'
          }]
        }]
      });

    } 

    //등급별회원비율
    if ($('#gradeRate').length ){  

      var echartPie = echarts.init(document.getElementById('gradeRate'), theme);

      echartPie.setOption({
        tooltip: {
          trigger: 'item',
          formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
          x: 'center',
          y: 'bottom',
          data: ['Direct Access', 'E-mail Marketing', 'Union Ad', 'Video Ads', 'Search Engine']
        },
        toolbox: {
          show: true,
          feature: {
            magicType: {
              show: true,
              type: ['pie', 'funnel'],
              option: {
                funnel: {
                  x: '25%',
                  width: '50%',
                  funnelAlign: 'left',
                  max: 1548
                }
              }
            },
            restore: {
              show: true,
              title: "Restore"
            },
            saveAsImage: {
              show: true,
              title: "Save Image"
            }
          }
        },
        calculable: true,
        series: [{
          name: '访问来源',
          type: 'pie',
          radius: '55%',
          center: ['50%', '48%'],
          data: [{
            value: 335,
            name: 'Direct Access'
          }, {
            value: 310,
            name: 'E-mail Marketing'
          }, {
            value: 234,
            name: 'Union Ad'
          }, {
            value: 135,
            name: 'Video Ads'
          }, {
            value: 1548,
            name: 'Search Engine'
          }]
        }]
      });

      var dataStyle = {
        normal: {
          label: {
            show: false
          },
          labelLine: {
            show: false
          }
        }
      };

      var placeHolderStyle = {
        normal: {
          color: 'rgba(0,0,0,0)',
          label: {
            show: false
          },
          labelLine: {
            show: false
          }
        },
        emphasis: {
          color: 'rgba(0,0,0,0)'
        }
      };

    } 

}
//메시지관리
$('.mail_list_column>a').on({
    'click': function(){
        var writerName = $(this).children().children().children('h3').text();
        var writerContents= $(this).children().children().children('p').text();
        var writerDate= $(this).children().children().children('h4').text();
        $('.mail_heading .date').text(writerDate);
        $('.view-mail .writerContents').text(writerContents);
        $('.sender-info .writerName').text(writerName);
        $(this).children().children().children('i').removeClass('fa-circle');
        $(this).children().children().children('i').addClass('fa-circle-o');
    }
});

// 상품 오늘등록 클릭
$('.todayRegiProductCount').on({
	'click':function(){
		$('.PtableTr').children().remove();
	}
});
// 상품 확인
$('#checkProduct').on({
	'click':function(){
		if($('.PNum').val()!=""){
			location.reload();
		}
	}
});
// 상품 수정
$('#editProduct').on({
	'click':function(){
		if($('.PNum').val()==""){
			alert("상품 선택해야지?");
		}else{
			var check = confirm("수정하려구?");
			if(check==true){
				$.ajax({
					url: mainPath+"/editProduct.admin",
					type: "post",
					data: {
						pNum: $('.PNum').val(),
						pImage: $('.PInfoImage').val().substr(12),
						pName: $('.PName').val(),
						pCategory: $('#selectCategory').val(),
						pOrigin: $('#selectOrigin').val(),
						pStock: $('.PStock').val(),
						pCost: $('.PCost').val(),
						pPrice: $('.PPrice').val(),
						pEvent: $('#selectPEvent').val()
					},
					success: function(data){
						alert($('.PName').val()+" 수정 완료!");
						$('.PNumD').each(function(index){
							if($(this).text()==($('.PNum').val())){
								$(this).siblings().eq(0).text($('#selectCategory').val());
								$(this).siblings().eq(1).text($('.PName').val());
								$(this).siblings().eq(3).text($('.PStock').val());
								$(this).siblings().eq(4).text($('.PCost').val());
								$(this).siblings().eq(5).text($('.PPrice').val());
								$(this).siblings().eq(6).text($('#selectOrigin').val());
								$(this).siblings().eq(7).text($('#selectPEvent').val());
								$(this).siblings().eq(8).text($('.PInfoImage').val().substr(12));
							}
						});
					},
					error: function(data){
						alert("전달 실패!!");
					}
				});
			}
			else alert("응 잘가~")
		}
	}
});
// 상품 삭제
$('#deleteProduct').on({
	'click':function(){
		if($('.PNum').val()==""){
			alert("상품 선택해야지?");
		}else{
			var check = confirm("삭제하려구?");
			if(check==true) alert("응 안돼~");
			else alert("응 잘가~")
		}
	}
});
// 상품 등록
$('#insertProduct').on({
	'click':function(event){
		if($('.insertPName').val()==""){
			alert("상품 이름 써야지?");
		}else if($('.insertPStock').val()==""){
			alert("재고수량 써야지?");
		}else if($('.insertPCost').val()==""){
			alert("원가 써야지?");
		}else if($('.insertPPrice').val()==""){
			alert("매가 써야지?");
		}else if($('.PInfoImage2').val()==""){
			alert("사진 안넣냐~");
		}else if($('#insertPEvent').val()=="없음"){
			var eventCheck = confirm("이벤트 선택 안해?");
			if(eventCheck == true){
				var check = confirm("등록하려구?");
				if(check==true){
					$.ajax({
						url: mainPath+"/insertProduct.admin",
						type: "post",
						data: {
							insertPImage: $('.PInfoImage2').val().substr(12),
							insertPName: $('.insertPName').val(),
							insertPCategory: $('#insertPCategory').val(),
							insertPOrigin: $('#insertPOrigin').val(),
							insertPStock: $('.insertPStock').val(),
							insertPCost: $('.insertPCost').val(),
							insertPPrice: $('.insertPPrice').val(),
							insertPEvent: $('#insertPEvent').val()
						},
						success: function(data){
							alert($('.insertPName').val()+" 등록 완료!");
							$('.todayRegiProductCount').text(data);
						},
						error: function(data){
							alert("전달 실패!!");
						}
					});
				}else alert("응 잘가~")
			}
			else{
				alert("선택해");
			}
		}
	}
});
// 상품 등록 취소
$('#cancleProduct').on({
	'click':function(){
		if($('.insertPName').val()!=""||$('.insertPStock').val()!=""||$('.insertPCost').val()!=""||$('.insertPPrice').val()!=""||$('.PInfoImage2').val()!=""){
			location.reload();
		}
	}
});
// 상품 발주
$('#insertProductOrder').on({
	'click':function(){
		if($('.insertPNumO').val()==""){
			alert("상품 번호가 없는데?");
		}else if($('#insertPOCompany').val()=="업체를 선정해주세요"){
			alert("업체 선정은?");
		}else if($('.insertPDateO').val()==""){
			alert("오늘이겠지?");
		}else if($('.insertPQO').val()==""){
			alert("몇개 주문할 건데?");
		}else{
			var check = confirm("주문하려구?");
			if(check==true){
				$.ajax({
					url: mainPath+"/insertProductOrder.admin",
					type: "post",
					data: {
						insertPNumO: $('.insertPNumO').val(),
						insertPOCompany: $('#insertPOCompany').val(),
						insertPQO: $('.insertPQO').val()
					},
					success: function(data){
						alert($('.insertPNumO').val()+" 주문 완료!");
						$('.todayProductOrderCount').text(data);
					},
					error: function(data){
						alert("전달 실패!!");
					}
				});
			}else alert("응 잘가~")
		}
	}
});
// 상품 발주 취소
$('#cancleProductOrder').on({
	'click':function(){
		if($('.insertPNumO').val()!=""||$('#insertPOCompany').val()!="업체를 선정해주세요"||$('.insertPDateO').val()!=""||$('.insertPQO').val()!=""){
			location.reload();
		}
	}
});
// 회원 확인 버튼
$('#checkMember').on({
	'click':function(){
		if($('.MNum').val()!=""){
			location.reload();
		}
	}
});
// 관리자 확인
$('#checkAdmin').on({
	'click':function(){
		if($('.ANum').val()!=""){
			location.reload();
		}
	}
});
// 관리자 수정
$('#editAdmin').on({
	'click':function(){
		if($('.ANum').val()==""){
			alert("관리자 선택해야지?");
		}else{
			var check = confirm("수정하려구?");
			if(check==true){
				$.ajax({
					url: mainPath+"/editAdmin.admin",
					type: "post",
					data: {
						aNum: $('.ANum').val(),
						aImage: $('.AInfoImage').val().substr(12),
						aPw: $('.APw').val(),
						aPhone: $('.APhone').val(),
						aEmail: $('.AEmail').val(),
						aAddress: $('.AAddress').val(),
						aSecurity: $('.ASecurity').val()
					},
					success: function(data){
						if(data==true){
							alert($('.AName').val()+" 수정 완료!");
							$('.ANumD').each(function(index){
								if($(this).text()==($('.ANum').val())){
									$(this).siblings().eq(1).text($('.APw').val());
									$(this).siblings().eq(4).text($('.ASecurity').val());
									$(this).siblings().eq(7).text($('.APhone').val());
									$(this).siblings().eq(8).text($('.AEmail').val());
									$(this).siblings().eq(9).text($('.AAddress').val());
									$(this).siblings().eq(10).text($('.AInfoImage').val().substr(12));
								}
							});
						}else alert("니가 그걸 왜 바꿔?");
					},
					error: function(data){
						alert("전달 실패!!");
					}
				});
			}
			else alert("응 잘가~")
		}
	}
});
// 관리자 삭제
$('#deleteAdmin').on({
	'click':function(){
		if($('.ANum').val()==""){
			alert("관리자  선택해야지?");
		}else{
			var check = confirm("삭제하려구?");
			if(check==true) alert("응 안돼~");
			else alert("응 잘가~")
		}
	}
});
// 관리자 등록
$('#insertAdmin').on({
	'click':function(){
		if($('.insertAID').val()==""){
			alert("아이디 적어~");
		}else if($('.insertAPW').val()==""){
			alert("비밀번호 적어~");
		}else if($('.insertAName').val()==""){
			alert("이름도 적고~");
		}else if($('.insertAGender').val()!="M" && $('.insertAGender').val()!="F"){
			alert("M/F로 적어~");
		}else if($('.insertABirthDate').val()==""){
			alert("선물은 안 줄 거지만 생년월일도 적어~");
		}else if($('.insertAEnrollDate').val()==""){
			alert("등록일은 오늘~");
		}else if($('.insertAPhone').val()==""){
			alert("전화번호 뭐에요?");
		}else if($('.insertAEmail').val()==""){
			alert("메일이 뭐에요?");
		}else if($('.insertAAddress').val()==""){
			alert("주소가 뭐에요?");
		}else if($('.insertASecondPW').val()==""){
			alert("2차 비밀번호 적어~");
		}else if($('.AInfoImage2').val()==""){
			alert("사진 안넣냐~");
		}else{
			var check = confirm("관리자야?");
			if(check==true){
				$.ajax({
					url: mainPath+"/insertAdmin.admin",
					type: "post",
					data: {
						insertAImage: $('.AInfoImage2').val().substr(12),
						insertAID: $('.insertAID').val(),
						insertAPW: $('.insertAPW').val(),
						insertAName: $('.insertAName').val(),
						insertAGender: $('.insertAGender').val(),
						insertABirthDate: $('.insertABirthDate').val(),
						insertAPhone: $('.insertAPhone').val(),
						insertAEmail: $('.insertAEmail').val(),
						insertAAddress: $('.insertAAddress').val(),
						insertASecondPW: $('.insertASecondPW').val()
					},
					success: function(data){
						alert($('.insertAName').val()+" 등록 완료!");
						location.reload();
					},
					error: function(data){
						alert("전달 실패!!");
					}
				});
			}else alert("응 잘가~")
		}
	}
});
// 관리자 등록 취소
$('#cancleAdmin').on({
	'click':function(){
		if($('.insertAID').val()!=""||$('.insertAPW').val()!=""||$('.insertAName').val()!=""||$('.insertAGender').val()!=""
			||$('.insertABirthDate').val()!=""||$('.insertAEnrollDate').val()!=""||$('.insertAPhone').val()!=""||$('.insertAEmail').val()!=""
				||$('.insertAAddress').val()!=""||$('.insertASecondPW').val()!=""||$('.AInfoImage2').val()!=""){
			location.reload();
		}
	}
});
// 주문/배송 상태 적용
$('#editOrderState').on({
	'click':function(){
		var recheck = confirm("확실해?");
		if($('.ONum').text()==""){
			alert("상품 번호가 읍당~");
		}else if(recheck){
			$.ajax({
				url: mainPath+"/editOrderState.admin",
				type: "post",
				data: {
					oNum: $('.ONum').text(),
					stateCode: $('.selected .step_no').text(),
					alterStateCode: $('.done .step_no').text()
				},
				success: function(data){
					if(data){
						alert($('.ONum').text()+" 수정 완료!");
						$('.OrderNum').each(function(index){
							if($(this).text()==($('.ONum').text())){
								$(this).siblings().eq(3).text($('.done .step_descr').text());
							}
						});
					}else if(!data && $('.done .step_no').text()==""){
						alert("변경할 게 읍넹~");
					}else alert("고롷겐 안되지~");
					
				},
				error: function(data){
					alert("전달 실패!!");
				}
			});
		}else{
			alert("다시 확인해");
		}
	}
});
// 주문/배송 환불
$('#refundOrder').on({
	'click':function(){
		if($('.ONum').text()==""){
			alert("주문번호가 없어~");
		}else{
			var refundCheck = confirm("꼭 이래야만 하니?");
			if(refundCheck){
				$.ajax({
					url: mainPath+"/refundOrder.admin",
					type: "post",
					data: {
						oNum: $('.ONum').text()
					},
					success: function(data){
						alert($('.ONum').text()+" 환불 완료!");
						$('.OrderNum').each(function(index){
							if($(this).text()==($('.ONum').text())){
								$(this).siblings().eq(3).text(data);
							}
						});
					},
					error: function(data){
						alert("전달 실패!!");
					}
				});
			}else{
				alert("다시 확인해");
			}
		}
	}
});
// 주문/배송 상태 변경 취소
$('#cancleOrderState').on({
	'click':function(){
		if($('.ONum').text()!=""){
			location.reload();
		}
	}
});
// FAQ 등록
$('#insertFAQ').on({
	'click':function(){
		if($('.faqCatecory').val()=="카테고리 선택"){
			alert("카테고리 선택해야지~");
		}else if($('.faqQuestion').val()==""){
			alert("질문 내용이 읍넹~");
		}else if($('.faqAnswer').text()==""){
			alert("답변이 없어~");
		}else{
			var faqCheck = confirm("등록하려구?");
			if(faqCheck && $('.faqNum').val()==""){
				$.ajax({
					url: mainPath+"/insertFAQBoard.admin",
					type: "post",
					data: {
						faqCatecory: $('.faqCatecory').val(),
						faqQuestion: $('.faqQuestion').val(),
						faqAnswer: $('.faqAnswer').text()
					},
					success: function(data){
						alert("FAQ 등록 완료!");
						$('.faqBoardCount').text(data);
					},
					error: function(data){
						alert("전달 실패!!");
					}
				});
			}else if($('.faqNum').val()!=""){
				alert("이건 수정해야지~");
			}else{
				alert("다시 확인해~");
			}
		}
	}
});
// FAQ 수정
$('#updateFAQ').on({
	'click':function(){
		if($('.faqNum').val()=="" && $('.faqCatecory').val()=="카테고리 선택" && $('.faqQuestion').val()=="" && $('.faqAnswer').text()==""){
			alert("입력좀...");
		}else if($('.faqNum').val()=="" && ($('.faqCatecory').val()!="카테고리 선택" || $('.faqQuestion').val()!="" || $('.faqAnswer').text()!="")){
			alert("이건 입력해야지~");
		}else if($('.faqCatecory').val()=="카테고리 선택"){
			alert("카테고리는?");
		}else if($('.faqQuestion').val()==""){
			alert("질문내용은?");
		}else if($('.faqAnswer').text()==""){
			alert("답변내용은?");
		}else{
			$.ajax({
				url: mainPath+"/updateFAQBoard.admin",
				type: "post",
				data: {
					faqNum: $('.faqNum').val(),
					faqCatecory: $('.faqCatecory').val(),
					faqQuestion: $('.faqQuestion').val(),
					faqAnswer: $('.faqAnswer').text()
				},
				success: function(data){
					alert($('.faqNum').val()+" 수정 완료!");
					$('.faqNumTd').each(function(index){
						if($(this).text()==($('.faqNum').val())){
							$(this).siblings().eq(0).text(data.memberNum);
							$(this).siblings().eq(1).text(data.submitDate);
							$(this).siblings().eq(2).text(data.contentCategory);
							$(this).siblings().eq(3).text(data.bTitle);
							$(this).siblings().eq(4).text(data.bContent);
						}
					});
				},
				error: function(data){
					alert("전달 실패!!");
				}
			});
		}
	}
});
// FAQ 취소
$('#cancleFAQ').on({
	'click':function(){
		if($('.faqCatecory').val()!="카테고리 선택" || $('.faqQuestion').val()!="" || $('.faqAnswer').text()!=""){
			location.reload();
		}
	}
});
// FAQ 삭제
$('#deleteFAQ').on({
	'click':function(){
		if($('.faqNum').val()==""){
			alert("삭제할 게 없넹~");
		}else{
			var faqAnswerPw = window.prompt('제일 존경하는 인물은?');
			$.ajax({
				url: mainPath+"/deleteFAQBoard.admin",
				type: "post",
				data: {
					faqNum: $('.faqNum').val(),
					faqAnswerPw: faqAnswerPw
				},
				success: function(data){
					if(data){
						alert($('.faqNum').val()+" 삭제 완료!");
						location.reload();
					}else{ 
						alert("누구냐 넌..");
					}
				},
				error: function(data){
					alert("전달 실패!!");
				}
			});
		}
	}
});
// 공지사항 등록
$('#insertNotice').on({
	'click':function(){
		if($('.noticeTitle').val()==""){
			alert("제목이 없어~");
		}else if($('.noticeContent').text()==""){
			alert("내용이 읍넹~");
		}else{
			var faqCheck = confirm("등록하려구?");
			if(faqCheck && $('.noticeNum').val()==""){
				$.ajax({
					url: mainPath+"/insertNoticeBoard.admin",
					type: "post",
					data: {
						noticeTitle: $('.noticeTitle').val(),
						noticeContent: $('.noticeContent').text()
					},
					success: function(data){
						alert("공지사항 등록 완료!");
						$('.noticeBoardCount').text(data);
					},
					error: function(data){
						alert("전달 실패!!");
					}
				});
			}else if($('.noticeNum').val()!=""){
				alert("이건 수정해야지~");
			}else{
				alert("다시 확인해~");
			}
		}
	}
});
// 공지사항 수정
$('#updateNotice').on({
	'click':function(){
		if($('.noticeNum').val()=="" && $('.noticeMemberNum').val()=="" && $('.noticeTitle').val()=="" && $('.noticeContent').text()==""){
			alert("입력좀...");
		}else if($('.noticeNum').val()=="" && ($('.noticeTitle').val()!="" || $('.noticeContent').text()!="")){
			alert("이건 등록해야지~");
		}else if($('.noticeTitle').val()==""){
			alert("제목?");
		}else if($('.noticeContent').text()==""){
			alert("내용?");
		}else{
			$.ajax({
				url: mainPath+"/updateNoticeBoard.admin",
				type: "post",
				data: {
					noticeNum: $('.noticeNum').val(),
					noticeTitle: $('.noticeTitle').val(),
					noticeContent: $('.noticeContent').text()
				},
				success: function(data){
					alert($('.noticeNum').val()+" 수정 완료!");
					$('.noticeNumTd').each(function(index){
						if($(this).text()==($('.noticeNum').val())){
							$(this).siblings().eq(0).text(data.memberNum);
							$(this).siblings().eq(1).text(data.submitDate);
							$(this).siblings().eq(3).text(data.bTitle);
							$(this).siblings().eq(4).text(data.bContent);
						}
					});
				},
				error: function(data){
					alert("전달 실패!!");
				}
			});
		}
	}
});
// 공지사항 취소
$('#cancleNotice').on({
	'click':function(){
		if($('.noticeNum').val()!="" || $('.noticeMemberNum').val()!="" || $('.noticeTitle').val()!="" || $('.noticeContent').text()!=""){
			location.reload();
		}
	}
});
// 공지사항 삭제
$('#deleteNotice').on({
	'click':function(){
		if($('.noticeNum').val()==""){
			alert("삭제할 게 없넹~");
		}else{
			var noticeAnswerPw = window.prompt('제일 존경하는 인물은?');
			$.ajax({
				url: mainPath+"/deleteNoticeBoard.admin",
				type: "post",
				data: {
					noticeNum: $('.noticeNum').val(),
					noticeAnswerPw: noticeAnswerPw
				},
				success: function(data){
					if(data){
						alert($('.noticeNum').val()+" 삭제 완료!");
						location.reload();
					}else{ 
						alert("누구냐 넌..");
					}
				},
				error: function(data){
					alert("전달 실패!!");
				}
			});
		}
	}
});
// 1:1 등록
$('#insertUserQuestion').on({
	'click':function(){
		$('#updateUserQuestion').click();
	}
});
// 1:1 수정
$('#updateUserQuestion').on({
	'click':function(){
		if($('.userQuestionNum').val()==""){
			alert("회원 글이 없네~");
		}else if($('.userQuestionNum').val()!="" && $('.userQuestionReply').val()==""){
			alert("답변 글 적어야지~");
		}else{
			$.ajax({
				url: mainPath+"/updateUserQuestionBoard.admin",
				type: "post",
				data: {
					userQuestionNum: $('.userQuestionNum').val(),
					userQuestionReply: $('.userQuestionReply').val()
				},
				success: function(data){
					alert($('.userQuestionNum').val()+" 수정 완료!");
					location.reload();
				},
				error: function(data){
					alert("전달 실패!!");
				}
			});
		}
	}
});
// 1:1 취소
$('#cancleUserQuestion').on({
	'click':function(){
		if($('.userQuestionNum').val()!="" || $('.userQuestionReply').val()!=""){
			location.reload();
		}
	}
});
// 1:1 삭제
$('#deleteUserQuestion').on({
	'click':function(){
		if($('.userQuestionNum').val()==""){
			alert("삭제할 게 없넹~");
		}else{
			var userQuestionAnswerPw = window.prompt('제일 존경하는 인물은?');
			$.ajax({
				url: mainPath+"/deleteUserQuestionBoard.admin",
				type: "post",
				data: {
					userQuestionNum: $('.userQuestionNum').val(),
					userQuestionAnswerPw: userQuestionAnswerPw
				},
				success: function(data){
					if(data){
						alert($('.userQuestionNum').val()+" 삭제 완료!");
						location.reload();
					}else{ 
						alert("누구냐 넌..");
					}
				},
				error: function(data){
					alert("전달 실패!!");
				}
			});
		}
	}
});
// 공지사항 클릭시
$('.noticeTable>tbody>tr').on({
    'click':function(){
        var noticeNum = $(this).children().eq(0).text();
        var noticeMemberNum = $(this).children().eq(1).text();
        var noticeTitle = $(this).children().eq(4).text();
        var noticeContent = $(this).children().eq(5).text();
        $('.noticeNum').val(noticeNum);
        $('.noticeMemberNum').val(noticeMemberNum);
        $('.noticeTitle').val(noticeTitle);
        $('.noticeContent').text(noticeContent);
    }
});
// FAQ 클릭시
$('.faqTable>tbody>tr').on({
    'click':function(){
        var faqNum = $(this).children().eq(0).text();
        var faqMemberNum = $(this).children().eq(1).text();
        var faqCatecory = $(this).children().eq(3).text();
        var faqQuestion = $(this).children().eq(4).text();
        var faqAnswer = $(this).children().eq(5).text();
        $('.faqNum').val(faqNum);
        $('.faqMemberNum').val(faqMemberNum);
        $('.faqCatecory').val(faqCatecory).prop('selected',true);
        $('.faqQuestion').val(faqQuestion);
        $('.faqAnswer').text(faqAnswer);
    }
});
// 1:1문의 클릭시
$('.userQuestionTable>tbody>tr').on({
    'click':function(){
        var userQuestionNum = $(this).children().eq(0).text();
        var userQuestionMemberNum = $(this).children().eq(1).text();
        var userQuestionTitle = $(this).children().eq(2).text();
        var userQuestionContent = $(this).children().eq(3).text();
        var userQuestionAdminNum = $(this).children().eq(5).text();
        var userQuestionReply = $(this).children().eq(6).text();
        $('.userQuestionNum').val(userQuestionNum);
        $('.userQuestionMemberNum').val(userQuestionMemberNum);
        $('.userQuestionTitle').val(userQuestionTitle);
        $('.userQuestionContent').val(userQuestionContent);
        if(userQuestionAdminNum!=""){
        	$('.userQuestionAdminNum').val(userQuestionAdminNum);
        	$('.userQuestionReply').val(userQuestionReply);
        }else{
        	$('.userQuestionAdminNum').val("");
        	$('.userQuestionReply').val("");
        }
    }
});
// 상품리뷰 클릭시
$('.reviewTable>tbody>tr').on({
    'click':function(){
        var reviewNum = $(this).children().eq(0).text();
        var reviewMemberNum = $(this).children().eq(1).text();
        var reviewProductNum = $(this).children().eq(3).text();
        var reviewRating = $(this).children().eq(4).text();
        var reviewTitle = $(this).children().eq(5).text();
        var reviewContent = $(this).children().eq(6).text();
        $('.reviewNum').val(reviewNum);
        $('.reviewMemberNum').val(reviewMemberNum);
        $('.reviewProductNum').val(reviewProductNum);
        $('.reviewRating').val(reviewRating);
        $('.reviewTitle').val(reviewTitle);
    	$('.reviewContent').val(reviewContent);
    }
});

//메소드 실행
$(document).ready(function() {
    init_sparklines();
    init_flot_chart();
    init_sidebar();
    init_wysiwyg();
    init_InputMask();
    init_JQVmap();
    init_cropper();
    init_knob();
    init_IonRangeSlider();
    init_ColorPicker();
    init_TagsInput();
    init_parsley();
    init_daterangepicker();
    init_daterangepicker_right();
    init_daterangepicker_single_call();
    init_daterangepicker_reservation();
    init_SmartWizard();
    init_EasyPieChart();
    init_charts();
    init_echarts();
    init_morris_charts();
    init_skycons();
    init_select2();
    init_validator();
    init_DataTables();
    init_chart_doughnut();
    init_gauge();
    init_PNotify();
    init_starrr();
    init_calendar();
    init_compose();
    init_CustomNotification();
    init_autosize();
    init_autocomplete();
});