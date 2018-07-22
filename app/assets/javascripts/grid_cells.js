$(function(){
	// Grid cell starts
	var gridCells = {};

	gridCells.updateColor = function(gridCellId) {
		$.ajax({
			type: 'PATCH',
			url: "/grid_cells/" + gridCellId,
			data: { color: gridCells.color },
			dataType: "script"
		});
	}

	$("#grid-container").on("click", ".grid-cell", function(){
		if (gridCells.color) {
			var gridCellId = $(this).data('id');
			gridCells.updateColor(gridCellId);
			delete gridCells['color'];
		} else {
			$.notify("Please select a color from colorpallet to color this square", "error");
		}
	});
	// Grid cell ends

	// Clipboard starts
	var clipboard = new ClipboardJS('#simple-drawing-clipboard');

	clipboard.on('success', function(e) {
		gridCells.color = e.text;
	  $.notify('Copied! Click on a square to color it', 'success');
	  e.clearSelection();
	});
	// Clipboard ends

	// Spectrum starts
	$("#simple-drawing-color-pallet").spectrum({
	  flat: true,
	  showInput: true,
	  preferredFormat: 'hex'
	});
	$(".sp-cancel, .sp-choose").remove();
	$(".sp-input").hide()
	$(".sp-container").css("z-index", '1');
	// Spectrum ends

	// Tooltip starts
	$( document ).tooltip({
		position: { my: "center bottom", at: "center top" }
	});
	// Tooltip ends
})
