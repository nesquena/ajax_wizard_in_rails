WizardForm = Behavior.create({
	initialize : function() {
	  this.setDefaults();
	  this.reviewEl = new WizardForm.Review(this.element.down('#review'));
	},
	onclick : Event.delegate({
		'a.section-link, a.section-link *' : function(e) { this.activateSection(e.findElement('a')); e.stop(); },
		'input[type=radio]' : function(e) { this.reviewEl.updateReview(); }
	}),
	activateSection : function(sectionLink) {
	  var sectionName = sectionLink.readAttribute('rel');
	  this._markActiveElement('.' + sectionName + '.section', '.section'      , 'active');
	  this._markActiveElement('.' + sectionName + '-nav'    , '.navigation li', 'selected');
	},
	setDefaults : function() {
	  this.activateSection(this.element.down('.navigation li a'));
	  this.element.select('.section').each(function(inputEl) {
	    inputEl.down('input').checked = true;
    });
	},
	_markActiveElement : function(elSelector, elClass, activeClass) {
	  this.element.select(elClass).invoke('removeClassName', activeClass);
	  this.element.down(elSelector).addClassName(activeClass);
	}
});

WizardForm.Review = Behavior.create({
  initialize : function() {
    this.componentsList = this.element.down('ul.components');
	  this.updateReview(); 
  },
  updateReview : function() {
    this._calculatePrice() || this._buildComponentsList();
	},
	_calculatePrice : function() {
	  var totalPrice = 300;
	  this._eachSelectedOption(function(inputEl) { totalPrice += inputEl.price; });
	  this.element.down('span.price').update('$' + totalPrice);
	  this.element.down('input.price').value = totalPrice;
	},
	_buildComponentsList : function() {
	  this.componentsList.update('');
	  this._eachSelectedOption(function(inputEl) { this.componentsList.insert($li(inputEl.desc)); }.bind(this));
	},
	_eachSelectedOption : function(callBack) {
	  this.element.previous('#design').select('input[type=radio]:checked').each(function(inputEl) {
	    inputEl.price = parseInt(inputEl.next('label').down('.option-price').readAttribute('rel'), 10);
	    inputEl.desc = inputEl.next('label').down('.option-name').innerHTML;
	    callBack(inputEl); 
	  }.bind(this));
	}
});

Event.addBehavior({
	'#wizard' : WizardForm
});