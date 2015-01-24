function pageObj(){

	var self 	= this;

	this.lang 	= 'pt_br';
	this.modal 	= {};

	this.forms 	= [];

	this.forms['loginForm'] = {
		title		:{pt_br:'Entrar',en_us:'Login'},
		titleIcon	:'fa fa-sign-in',
		fields		:[{
			label 		:{ pt_br:'Usuário ou E-mail', en_us:'User or Email'},
			placeholder	:{ pt_br:'Nome de usuário ou e-mail', en_us:'type user or email'},
			name 		:'loginUsername',
			type 		:'text',
			options 	:[],
			validation 	:{ required : true }
		},{
			label		:{ pt_br:'Senha', en_us:'Password'},
			placeholder	:{ pt_br:'Digite sua senha', en_us:'type your password'},
			name		:'loginPassword',
			type 		:'password',
			options 	:[],
			validation	:{ required : true }
		},{
			label		:	{ pt_br:'Você quer ficar conectado ?', en_us:''},
			placeholder	:	{ pt_br:'', en_us:''},
			name		:	'loginKeepMeLoggedIn',
			type		:	'checkbox',
			options:[
			{
				value:	'keepmeloggedin',
				label:	{ pt_br:'Mantenha-me conectado', en_us:'Keep me logged in'},
			}
			],
			validation	:{ required : false }
		}],
		buttons		:[
		{
			itemClass	: 'btn btn-success',
			icon 		: 'fa fa-check-square-o',
			text 		: {	pt_br : 'Entrar', en_us:'Sign In'	},
			actionId 	: 'confirm',
			action 		: function($scope){
				var validate 	= $scope.validateModal(),
					status 		= validate.status,
					jsonString 	= validate.responseObj;

				if(status){
					console.log('Enviar via ajax => ' + jsonString);
					$scope.closeModal();
				}else{
					console.log('Formulário com erro => ' + jsonString);
				}
			}	
		},
		{
			itemClass 	: 'btn btn-danger',
			icon 		: 'fa fa-times',
			text 		: {	pt_br : 'Cancelar', en_us:'Cancelar'	},
			actionId 	: 'cancel',
			action 		: function($scope){
					$scope.closeModal();
			}
		},
		],

	};

	this.forms['signUpForm'] = {
		title		:{pt_br:'Junte-se a nós!',en_us:'Join us!'},
		titleIcon	:'fa fa-rocket',
		fields		:[{
			label:{ pt_br:'Nome de Usuário ', en_us:'Username'},
			placeholder:{ pt_br:'Digite seu nome de usuário', en_us:'Type your username'},
			name:'signupUsername',
			type:'text',
			options:[],
			validation	:{ required : true }
		},{
			label:{ pt_br:'Endereço de E-mail ', en_us:'Email'},
			placeholder:{ pt_br:'Digite seu email', en_us:'Type your email'},
			name:'signupEmail',
			type:'email',
			options:[],
			validation	:{ required : true }
		},{
			label:{ pt_br:'Senha', en_us:'Password'},
			placeholder:{ pt_br:'Digite sua senha', en_us:'type your password'},
			name:'signupPassword',
			type:'password',
			options:[],
			validation	:{ required : true }
		},{
			label:{ pt_br:'Você aceita os <a href="#">termos de uso</a>?', en_us:'Do you accept the <a href="#">user terms</a>?'},
			placeholder:{ pt_br:'', en_us:''},
			name:'userTerms',
			type:'checkbox',
			options:[
			{
				value:'userTerms',
				label:{ pt_br:'Sim, eu aceito.', en_us:'Yes, i accept.'},
			},
			],
			validation	:{ required : true }
		}],
		buttons		:[
		{
			itemClass	: 'btn btn-success',
			icon 		: 'fa fa-check-square-o',
			text 		: {	pt_br : 'Entrar', en_us:'Sign In'	},
			actionId 	: 'confirm',
			action 		: function($scope){
				var validate 	= $scope.validateModal(),
					status 		= validate.status,
					jsonString 	= validate.responseObj;

				if(status){
					console.log('Enviar via ajax => ' + jsonString);
					$scope.closeModal();
				}else{
					console.log('Formulário com erro => ' + jsonString);
				}
			}	
		},
		{
			itemClass 	: 'btn btn-danger',
			icon 		: 'fa fa-times',
			text 		: {	pt_br : 'Cancelar', en_us:'Cancelar'	},
			actionId 	: 'cancel',
			action 		: function($scope){
				$scope.closeModal();
			}
		},
		],
	};


	this.forms['forgotPasswordForm'] = {
		title		:{pt_br:'Esqueceu sua senha?',en_us:'Forget your password?'},
		titleIcon	:'fa fa-key',
		fields		:[{
			label 		:{ pt_br:'Usuário ou E-mail', en_us:'User or Email'},
			placeholder	:{ pt_br:'Digite seu nome de usuário ou e-mail', en_us:'type user or email'},
			name 		:'forgotPassword',
			type 		:'text',
			options 	:[],
			validation 	:{ required : true }
		}],
		buttons		:[
		{
			itemClass	: 'btn btn-success',
			icon 		: 'fa fa-check-square-o',
			text 		: {	pt_br : 'Me envie um email de recuperação', en_us:'Send me an email recovery'	},
			actionId 	: 'confirm',
			action 		: function($scope){
				var validate 	= $scope.validateModal(),
					status 		= validate.status,
					jsonString 	= validate.responseObj;

				if(status){
					console.log('Enviar via ajax => ' + jsonString);
					$scope.closeModal();
				}else{
					console.log('Formulário com erro => ' + jsonString);
				}
			}	
		},
		{
			itemClass 	: 'btn btn-danger',
			icon 		: 'fa fa-times',
			text 		: {	pt_br : 'Cancelar', en_us:'Cancelar'	},
			actionId 	: 'cancel',
			action 		: function($scope){
					$scope.closeModal();
			}
		},
		],

	};



	/**
	* This function validate form fields based on this.modal 
	* object and return an object with the status and json string of result
	* 
	* 
	* @returns {Object}
	*/
	this.validateModal = function(){
		var responseObj = [];
		var status = true;
		for(var i in self.modal.fields){
			switch(self.modal.fields[i].type){
				case 'email':
				
				var value = $( '[name="' + self.modal.fields[i].name + '"]' ).val();
				if( self.modal.fields[i].validation.required){
					if(value.trim().length == 0 || ! self.valueValidate('email', value)){
						status = false;
						responseObj.push({
							status: false,
							name: self.modal.fields[i].name,
							value: value,
						});

					}else{
						responseObj.push({
							status: true,
							name: self.modal.fields[i].name,
							value: value,
						});
					}
				}else{

					if(re.test(value)){
						responseObj.push({
							status: true,
							name: self.modal.fields[i].name,
							value: value,
						});
					}else{
						status = false;
						responseObj.push({
							status: false,
							name: self.modal.fields[i].name,
							value: value,
						});
					}

				}
				break;
				case 'text':
				case 'password':
				default:
				var value = $( '[name="' + self.modal.fields[i].name + '"]' ).val();
				if( self.modal.fields[i].validation.required){
					if(value.trim().length == 0){
						status = false;
						responseObj.push({
							status: false,
							name: self.modal.fields[i].name,
							value: value,
						});

					}else{
						responseObj.push({
							status: true,
							name: self.modal.fields[i].name,
							value: value,
						});
					}
				}else{
					responseObj.push({
						status: true,
						name: self.modal.fields[i].name,
						value: value,
					});
				}
				break;
				case 'checkbox':
				case 'radio':
				var checkboxOptions = [];
				if( self.modal.fields[i].validation.required){
					if($( 'html [name="' + self.modal.fields[i].name + '"]:checked' ).size() == 0){
						status = false;
						for(var a in self.modal.fields[i].options){
							if($('[name="' + self.modal.fields[i].name + '"][value="' + self.modal.fields[i].options[a].value + '"]').is(':checked')){
								checkboxOptions.push({ value:  self.modal.fields[i].options[a].value, checked: true }) ;
							}else{
								checkboxOptions.push({ value:  self.modal.fields[i].options[a].value, checked: false });
							}
						}
						responseObj.push({
							status: false,
							name: self.modal.fields[i].name,
							value: checkboxOptions,
						});
					}else{
						for(var a in self.modal.fields[i].options){
							if($('[name="' + self.modal.fields[i].name + '"][value="' + self.modal.fields[i].options[a].value + '"]').is(':checked')){
								checkboxOptions.push({ value:  self.modal.fields[i].options[a].value, checked: true }) ;
							}else{
								checkboxOptions.push({ value:  self.modal.fields[i].options[a].value, checked: false });
							}
						}
						responseObj.push({
							status: true,
							name: self.modal.fields[i].name,
							value: checkboxOptions,
						});
					}
				}else{
					for(var a in self.modal.fields[i].options){
						if($('[name="' + self.modal.fields[i].name + '"][value="' + self.modal.fields[i].options[a].value + '"]').is(':checked')){
							checkboxOptions.push({ value:  self.modal.fields[i].options[a].value, checked: true }) ;
						}else{
							checkboxOptions.push({ value:  self.modal.fields[i].options[a].value, checked: false });
						}
					}
					responseObj.push({
						status: true,
						name: self.modal.fields[i].name,
						value: checkboxOptions,
					});

				}

				break;
			}

		}
		return {status: status, responseObj: JSON.stringify(responseObj)};
	}


	/**
	* This function validate form entry values
	* 
	* @example 
	*   self.valueValidate('int', 5); // true
	*   self.valueValidate('email', 'abc@sda'); // false
	*   self.valueValidate('email', 'contact@site.com'); // true
	* 
	* @param   {String} type 	type of validation
	* @param   {String} value   value to be validate
	* @returns {Bolean}
	*/
	this.valueValidate = function(type, value){
		if('undefined' == typeof value)  
			return false;

		type = (type || 'alphaNumeric');

		switch(type){
			case 'alphaNumeric':
			return /^[A-Za-z\d\s]+$/.test(value);
			break;
			case 'email':
			return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value);
			break;
		}
		return false;
	}

	/**
	* This function open a modal parsing the self.form templates
	* 
	* @example 
	*   self.openModal('loginForm'); // open the login modal form
	* 
	* @param   {String} [formType ]	form type template
	* @returns {undefined}
	*/
	this.openModal = function(formType){

		var form 	=  ( formType || 'loginForm'),
			html 	= '', 
			buttons = '';
		if(self.closeModal()){
			self.modal = self.forms[form];
		}else{
			return false;
		}

		for(var i in self.modal.fields){

			switch(self.modal.fields[i].type){
				case 'text':
				case 'email':
				default:
				html +='<div class="form-group"><label for="'+self.modal.fields[i].name+'">'+ eval('self.modal.fields[i].label.' + self.lang) ;
				(self.modal.fields[i].validation.required)? html += '*':'';
				html +='</label> <input type="'+self.modal.fields[i].type+'" class="form-control" id="'+self.modal.fields[i].name+'" name="'+self.modal.fields[i].name+'" placeholder="'+ eval('self.modal.fields[i].placeholder.' + self.lang) +'"></div>';
				break;
				case 'checkbox':
				html +='<div class="checkbox"><h5>'+ eval('self.modal.fields[i].label.' + self.lang) ;
				(self.modal.fields[i].validation.required)? html += '*':'';
				html +='</h5>';

				for(var a in self.modal.fields[i].options){
					html +='<label><input type="checkbox" name="'+ self.modal.fields[i].name +'" value="'+ self.modal.fields[i].options[a].value +'"> '+ eval('self.modal.fields[i].options[a].label.' + self.lang) +'</label><br />';
				}

				html +='</div>';
				break;
			}
		}

		for(var i in self.modal.buttons){
			buttons += '<button type="button" class="'+self.modal.buttons[i].itemClass+' buttonModal" actionid="'+self.modal.buttons[i].actionId+'"><i class="'+self.modal.buttons[i].icon+'"></i> '+eval('self.modal.buttons[i].text.' + self.lang)+'</button>';
		}

		$('body').append('<div class="bgModal closeModal animated fadeIn"></div>');

		$('body').append('<div class="sectionModal animated bounceInDown"><div class="sectionModalHeader"><h3><i class="'+self.modal.titleIcon+'"></i> '+ eval('self.modal.title.' + self.lang) +'</h3><i class="fa fa-times closeModal"></i></div><div class="sectionModalBody col-xs-12"><div class="col-xs-12">'+html+'</div></div><div class="sectionModalFooter">'+ buttons +'</div></div>');
	}

	/**
	* This function close modals and clean modal object 
	* 
	* @example 
	*   self.openModal(); // close modals
	* 
	* @returns {Bolean}
	*/
	this.closeModal = function(){
		if(jQuery.isEmptyObject(self.modal)){
			return true;
		}else{
			self.modal = {};

			$('.sectionModal').removeClass('animated bounceInDown').addClass('animated bounceOutDown');
			setTimeout(function(){
				$('.sectionModal').remove();
				$('.bgModal').removeClass('animated fadeIn').addClass('animated fadeOut');
				setTimeout(function(){
					$('.bgModal').remove();
				},500);
			},500);
			return false;
		}
		
	}

};

	 	var obj = new pageObj();


	 	$(document).on('click','[openModal]',function(event){
	 		this.modal = {};
	 		var modal = $(this).attr('openModal');
	 		obj.openModal(modal);
	 	});

	 	$(document).on('click','.closeModal',function(event){
	 		obj.closeModal();
	 	});

	 	$(document).on('click','.buttonModal',function(event){
	 		var id 	= $(this).attr('actionid'),
	 			len = obj.modal.buttons.length;
	 		for ( i = 0; i <  len; i++){
	 			if(obj.modal.buttons[i].actionId == id){
	 				obj.modal.buttons[i].action(obj);
	 				return;
	 			}
	 		}
	 	});




