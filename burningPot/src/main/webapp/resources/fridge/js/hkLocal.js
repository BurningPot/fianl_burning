
$( function() { 
	
    $( document ).tooltip({
        position: {
        my: "center bottom-10",
        at: "center top",
        using: function( position, feedback ) {
            $( this ).css( position );
            $( "<div>" )
            .addClass( "arrow" )
            .addClass( feedback.vertical )
            .addClass( feedback.horizontal )
            .appendTo( this );
            }
        }
    });
    
} );

function bgChange(bgColor){
    $('#ingredient').attr('class', bgColor+' rounded p-4');
}

function dragDrop(){
    var $ingredient = $( "#real-ingre" ),
    $ingre = $ingredient.children("div"),
    $refrigerator = $( "#refrigerator" ),
    $ref = $('#real-ref').children("div");
	
	$( "div", $ingredient ).draggable({
	    cancel: "a.ui-icon", // clicking an icon won't initiate dragging
	    revert: "invalid", // when not dropped, the item will revert back to its initial position
	    helper: "clone",
	    cursor: "pointer"
	});
	
	$refrigerator.droppable({
	    accept: "#real-ingre div",
	    classes: {
	        "ui-droppable-active": "ui-state-highlight"
	    },
	    drop: function( event, ui ) {
	        goToRef( ui.draggable );
	    }
	});
	
	$('#ref-box').droppable({
	    accept: "#real-ingre div",
	    drop: function( event, ui ) {
	        goToRef( ui.draggable );
	    }
	});
	
	$('#ingredient').droppable({
	    accept: "#refrigerator div",
	    classes: {
	        "ui-droppable-active": "custom-state-active"
	    },                
	    drop: function( event, ui ) {
	        goToIngre( ui.draggable );
	    }
	});
	
	// Image to Refrigerator function
	function goToRef( $item ) {
	    $item.fadeOut(function() {
	        $item.appendTo( $('#real-ref') ).fadeIn(function() {
	        $item.animate( "width", "7vh" ).find( "img" ).animate( "height", "7vh" );
	        $item.children('img').addClass('inRef').removeClass('inIngre');
	        });
	    });
	}
	
	// Image to Ingerdient function
	function goToIngre( $item ) {
	    $item.fadeOut(function() {
	    $item.css("width", "7vh").find( "img" ).css( "height", "7vh" ).end().appendTo( $ingredient ).fadeIn();
	    $item.children('img').addClass('inIngre').removeClass('inRef');
	    });
	}
	
	// Resolve the icons behavior with event delegation
	$ingre.on( "click", function( event ) {
	    var $item = $( this );
	    $target = $( event.target );
	    if($target.is('.inIngre')) goToRef($item);
	    else if($target.is('.inRef')) goToIngre($item);
	    return false;
	});
	
}


