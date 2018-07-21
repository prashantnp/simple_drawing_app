$(function(){
	var gridCells = {};
	var clipboard = new ClipboardJS('#simple-drawing-clipboard');

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
	})

	clipboard.on('success', function(e) {
		gridCells.color = e.text;
	  $.notify('Copied! Click on a square to color it', 'success');
	  e.clearSelection();
	});

	$("#simple-drawing-color-pallet").spectrum({
	  flat: true,
	  showInput: true,
	  preferredFormat: 'hex'
	});
	$(".sp-cancel, .sp-choose").remove();
	$(".sp-input").hide()
	$(".sp-container").css("z-index", '1');	
})
