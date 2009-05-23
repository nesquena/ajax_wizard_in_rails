WizardForm = Behavior.create({
	initialize : function() {
		this.activateSection("colors");
		this.updateReview(); 
	},
	onclick : Event.delegate({
		'a.section-link, a.section-link *' : function(e) { this.activateSection(e.findElement('a').readAttribute('rel')); },
		'input[type=radio]' : function(e) { this.updateReview(); }
	}),
	activateSection : function(sectionName) {
		this.element.select('.section').invoke('removeClassName', 'active');
		this.element.select('.navigation li').invoke('removeClassName', 'selected');
		this.element.down('.' + sectionName + '.section').addClassName('active');
		this.element.down('.' + sectionName + '-nav').addClassName('selected');
	},
	updateReview : function() {
	  var totalPrice = 0;
	  var componentsList = this.element.up('#customize-computer').down('#review ul.components');
	  var priceEl = this.element.up('#customize-computer').down('#review span.price');
	  var priceField = this.element.up('#customize-computer').down('#review input.price');
	  componentsList.update('');
	  this.element.select('input[type=radio]:checked').each(function(inputEl) {
	    var description = inputEl.next('label').down('.option-name').innerHTML;
	    var price = inputEl.next('label').down('.option-price').innerHTML.match(/\d+/)[0];
  	  if (inputEl.checked) { 
  	    totalPrice += parseInt(price, 10); 
  	    componentsList.insert($li(description));
  	  }
	  }.bind(this));
	  priceEl.update('$' + totalPrice);
	  priceField.value = totalPrice;
	}
});

Event.addBehavior({
	'#wizard' : WizardForm
});