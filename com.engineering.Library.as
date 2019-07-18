package com.engineering {
 
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import flash.display.MovieClip;
	import fl.controls.ComboBox;
	import fl.controls.Button;
	
	import flash.text.TextField;
	
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	import fl.transitions.*;
	import fl.transitions.easing.*; 
	
	import flash.net.*;
	import flash.net.URLLoader;  
	import flash.net.URLRequest;  
	
	import com.engineering.components;
 
	public class Library extends MovieClip {
 		private var xml_filename:String;
 		//Create variable for ComboBox One
		private var menuOneComboBox:ComboBox;
		//Create variable for ComboBox Two
		private var menuTwoComboBox:ComboBox;
		
		//load and create RadioButtons for different XML files
		//Conventional Air Terminals
		var AT:components = new components(xml_filename="xml/AT.xml");
		//Dissipation Terminals
		var DT:components = new components(xml_filename="xml/DT.xml");
		//Grounding Components
		var GR:components = new components(xml_filename="xml/GR.xml");
		//Bonding Equipment
		var BD:components = new components(xml_filename="xml/BD.xml");
		//TerraDyne Grounding System
		var TD:components = new components(xml_filename="xml/TD.xml");
		//Connectors & Fittings
		var SP:components = new components(xml_filename="xml/SP.xml");
	
		//Create Close Button
		private var close_buton:Button;
	
		//Default Constructor
		public function Library():void {
			initComponents();
			fillComboBoxOne();
		}
 
 		//Populates the Combobox with data
		private function fillComboBoxOne():void {
			menuOneComboBox.prompt = "Make Selection";
			menuOneComboBox.addItem({label: "Components"});
			menuOneComboBox.addItem({label: "Specifications"});
			menuOneComboBox.addItem({label: "Catalogs"});
			menuOneComboBox.addItem({label: "Brochures"});
		}
 
  		//Second menu item based on first menu item
		private function fillComboBoxTwo(selectedText):void 
		{
			//remove all items first
			menuTwoComboBox.removeAll();
			menuTwoComboBox.prompt = "Make Selection";
			//Fills Second Menu Based off of section from the first menu
			if (selectedText == "Components")
			{
				menuTwoComboBox.addItem({label: "Conventional Air Terminals", data:100});
				menuTwoComboBox.addItem({label: "Point Discharge Terminals", data:101});
				menuTwoComboBox.addItem({label: "Grounding", data:102});
				menuTwoComboBox.addItem({label: "Bonding", data:103});
				menuTwoComboBox.addItem({label: "TerraDyne Grounding System", data:104});
				menuTwoComboBox.addItem({label: "Conductor Connections", data:105});
			}
			else if (selectedText == "Specifications")
			{
				menuTwoComboBox.addItem({label: "Conventional Lightning Protection", data:200});
				menuTwoComboBox.addItem({label: "Lightning Dissipation Systems", data:201});
				menuTwoComboBox.addItem({label: "Proactive Lightning Protection", data:202});
				menuTwoComboBox.addItem({label: "Grounding Systems", data:203});
				menuTwoComboBox.addItem({label: "Surge Suppression", data:204});
			}
			else if (selectedText == "Catalogs")
			{
				menuTwoComboBox.addItem({label: "Grounding", data:300});
				menuTwoComboBox.addItem({label: "Lightning Protection", data:301});
				menuTwoComboBox.addItem({label: "Surge Suppression", data:302});
				menuTwoComboBox.addItem({label: "Exothermic Welding", data:303});
			}
			else if (selectedText == "Brochures")
			{
				menuTwoComboBox.addItem({label: "Corporate Brochure", data:400});
				menuTwoComboBox.addItem({label: "PowerTrip Brochure", data:401});
				menuTwoComboBox.addItem({label: "TerraDyne Brochure", data:402});
				menuTwoComboBox.addItem({label: "TerraFill Brochure", data:403});
				menuTwoComboBox.addItem({label: "TerraStat Brochure", data:404});
				menuTwoComboBox.addItem({label: "TerraStreamer Brochure", data:405});
				menuTwoComboBox.addItem({label: "TerraWeld Brochure", data:406});
			}
		}
 
 		//Gets the text selected and passes it to the function
		//That adds items to the second menu item
 		private function changeMenuTwo(e:Event):void
		{
			var selectedText = menuOneComboBox.selectedLabel;
			fillComboBoxTwo(selectedText);
			
		}
		
		//Gets the text selected and perfoms a function based on it
		//That adds items to the second menu item
 		private function getRequest(e:Event):void
		{
			var selectedOption = menuTwoComboBox.selectedItem.data;
			
			if (selectedOption == 100)
			{
				//Create close Button
				var at_close_btn:Button = createCloseButton(); 
				AT.addChild(at_close_btn);
								
				AT.x = 12
				AT.y = 25;
				var AT_MC:TransitionManager = new TransitionManager(AT);
				AT_MC.startTransition({type:Fade, direction:Transition.IN});
				addChild(AT);
				//Disable ComboBoxs
				menuOneComboBox.enabled = false;
				menuTwoComboBox.enabled = false;
			}
			if (selectedOption == 101)
			{
				//Create close Button
				var dt_close_btn:Button = createCloseButton(); 
				DT.addChild(dt_close_btn);
				
				DT.x = 12;
				DT.y = 25;
				var DT_MC:TransitionManager = new TransitionManager(DT);
				DT_MC.startTransition({type:Fade, direction:Transition.IN});
				addChild(DT);
				//Disable ComboBoxs
				menuOneComboBox.enabled = false;
				menuTwoComboBox.enabled = false;
			}
			if (selectedOption == 102)
			{
				//Create close Button
				var gr_close_btn:Button = createCloseButton(); 
				GR.addChild(gr_close_btn);
				
				GR.x = 12;
				GR.y = 25;
				var GR_MC:TransitionManager = new TransitionManager(GR);
				GR_MC.startTransition({type:Fade, direction:Transition.IN});
				addChild(GR);
				//Disable ComboBoxs
				menuOneComboBox.enabled = false;
				menuTwoComboBox.enabled = false;
			}
			if (selectedOption == 103)
			{
				//Create close Button
				var bd_close_btn:Button = createCloseButton(); 
				BD.addChild(bd_close_btn);
				
				BD.x = 12;
				BD.y = 25;
				var BD_MC:TransitionManager = new TransitionManager(BD);
				BD_MC.startTransition({type:Fade, direction:Transition.IN});
				addChild(BD);
				//Disable ComboBoxs
				menuOneComboBox.enabled = false;
				menuTwoComboBox.enabled = false;
			}
			if (selectedOption == 104)
			{
				//Create close Button
				var td_close_btn:Button = createCloseButton(); 
				TD.addChild(td_close_btn);
				
				TD.x = 12;
				TD.y = 25;
				var TD_MC:TransitionManager = new TransitionManager(TD);
				TD_MC.startTransition({type:Fade, direction:Transition.IN});
				addChild(TD);
				//Disable ComboBoxs
				menuOneComboBox.enabled = false;
				menuTwoComboBox.enabled = false;
			}
			if (selectedOption == 105)
			{
				//Create close Button
				var sp_close_btn:Button = createCloseButton(); 
				SP.addChild(sp_close_btn);
				
				SP.x = 12;
				SP.y = 25;
				var SP_MC:TransitionManager = new TransitionManager(SP);
				SP_MC.startTransition({type:Fade, direction:Transition.IN});
				addChild(SP);
				//Disable ComboBoxs
				menuOneComboBox.enabled = false;
				menuTwoComboBox.enabled = false;
			}
			if (selectedOption >= 200)
			{
				var url:String = "";
				if (selectedOption >= 400)
				{
					url = "files/brochures/" + findFileName(selectedOption);
				}
				else if (selectedOption >= 300)
				{
					url = "files/catalogs/" + findFileName(selectedOption);
				}
				else if (selectedOption >= 200)
				{
					url = "files/specifications/" + findFileName(selectedOption);
				}
				var request:URLRequest = new URLRequest(url);
 				navigateToURL(request, '_blank');
			}
		}

		//Sets the file name for any numeric option that will open a document.
		private function findFileName(selectedOption)
		{
				var filename;
				
				if (selectedOption == 200)
				{
					filename = "conventional-lp-specs.rtf";
				}
				if (selectedOption == 201)
				{
					filename = "dissipation-lp-specs.rtf";
				}
				if (selectedOption == 202)
				{
					filename = "active-lp-specs.rtf";
				}
				if (selectedOption == 203)
				{
					filename = "grounding-specs.rtf";
				}
				if (selectedOption == 204)
				{
					filename = "surge-suppression-specs.rtf";
				}
				if (selectedOption == 300)
				{
					filename = "grounding-catalog.pdf";
				}
				if (selectedOption == 301)
				{
					filename = "lightningProtection-catalog.pdf";
				}
				if (selectedOption == 302)
				{
					filename = "surgeSuppression-catalog.pdf";
				}
				if (selectedOption == 303)
				{
					filename = "exothermicWelding-catalog.pdf";
				}
				if (selectedOption == 400)
				{
					filename = "corporate-brochure.pdf";
				}
				if (selectedOption == 401)
				{
					filename = "powertrip-brochure.pdf";
				}
				if (selectedOption == 402)
				{
					filename = "terradyne-brochure.pdf";
				}
				if (selectedOption == 403)
				{
					filename = "terrafill-brochure.pdf";
				}
				if (selectedOption == 404)
				{
					filename = "terrastat-brochure.pdf";
				}
				if (selectedOption == 405)
				{
					filename = "terrastreamer-brochure.pdf";
				}
				if (selectedOption == 406)
				{
					filename = "terraweld-brochure.pdf";
				}
				
				return filename;
		}
		
		private function closeWindow(e:MouseEvent):void 
		{
			//showChildren(stage);
			var callingParent:components = e.target.parent;
			removeChild(callingParent);
			menuOneComboBox.enabled = true;
			menuTwoComboBox.enabled = true;
			menuTwoComboBox.selectedIndex = -1;
			stage.removeEventListener(MouseEvent.CLICK, closeWindow);
			
		}
		//Debugging function
		function showChildren(dispObj:*):void
		{	
			for(var i:int =0; i<dispObj.numChildren; i++) 
			{
				var obj:DisplayObject = dispObj.getChildAt(i);
				if (obj is DisplayObjectContainer) 
				{
					trace(obj.name, obj);
					//removeChild(obj);
					showChildren(obj);
				}
				else 
				{
					//removeChild(obj);
					trace(obj);
				}
			}
		}
		
		private function createCloseButton()
		{
			//Create close Button
			var close_button:Button = new Button;
			close_button.label = "Close";
			close_button.emphasized = true;
			close_button.width = 50;
			close_button.move(920, 20);
			close_button.addEventListener(MouseEvent.CLICK,closeWindow);
			return close_button;
		}
				
		//Creates the components on the screen
		private function initComponents():void {
			//Create the First Menu Item
			menuOneComboBox = new ComboBox();
			//Set the location of the comboBox on the stage
			menuOneComboBox.x = 100;
			menuOneComboBox.y = 375;
			//Format Width of Button
			menuOneComboBox.width = 150;
			menuOneComboBox.dropdownWidth = 150;
			//Add event listener 
			//that calls the function to change the second menu items
			menuOneComboBox.addEventListener(Event.CHANGE, changeMenuTwo);
			//Add the ComboBox to the Canvas
			addChild(menuOneComboBox);
 
 			//Create the Second Menu Item
			menuTwoComboBox = new ComboBox();
			//Format Width of Button
			menuTwoComboBox.width =  200;
			menuTwoComboBox.dropdownWidth = 200;
			//Set the location of the comboBox on the stage
			menuTwoComboBox.x = 255;
			menuTwoComboBox.y = 375;
			//Add event listener 
			//that performs and action when second menu choice is made
			menuTwoComboBox.addEventListener(Event.CHANGE, getRequest);
			//Add the ComboBox to the Canvas
			addChild(menuTwoComboBox);
		}
	}
}