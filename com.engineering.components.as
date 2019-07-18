package com.engineering {
 
 	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import fl.controls.RadioButton;
	import fl.controls.Button;
	
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import flash.net.*;
	import flash.net.URLLoader;  
	import flash.net.URLRequest;  
 	import flash.xml.XMLDocument;
	
	import fl.containers.ScrollPane;
	import fl.events.ComponentEvent;
	
 public class components extends MovieClip
 {
		//create XML variable
		private var xml:XML;  
		private var dt_radioButtons = new Object();
		
		//RadioButton & Preview container
		private var DT_Area:components_mc;
		private var RB_Area:rb_area;
		private var SW_Area:selected_mc;
		//preview information
		private var description:TextField;
		
		//Text Styles
		private var format:TextFormat;
		private var format_rb:TextFormat;
		private var format_cb_over:TextFormat;
		
		//SCroll Pane Variables
		var MAX_SCROLLPANE_WIDTH:uint = 850;
		var MAX_SCROLLPANE_HEIGHT:uint = 550;
		var previewScrollPane:ScrollPane = new ScrollPane();
		var zoomInButton:Button = new Button();
		var zoomOutButton:Button = new Button();
			
        public function components(xml_filename:String="") 
		{
			//xml_filename = "DT.xml";
			getXML(xml_filename);
		}
  
        public function getXML(xml_filename)  
        {  
            var loader:URLLoader = new URLLoader();  
            loader.addEventListener(Event.COMPLETE, xmlDisplay);  
            loader.load(new URLRequest(xml_filename));  
        }  
  
        private function xmlDisplay(e:Event) 
        {  
            xml = new XML(e.target.data);  
			parseXML(xml);
        }  
		
		function parseXML(dtXML:XML):void  
		{
			//Stores relationship between letters and description in an object
			var i =0;
			for each (var d in dtXML.listItem)
			{
				var dt_label = d.label;
				var dt_data = d.data;
				
				dt_radioButtons[i] = {label: dt_label, data: dt_data};
				i++
			}
			setup();
		}
		
		private function changeDescription(e:MouseEvent):void 
		{
		   
			//Create styles to for checkbox rollover
			var format_cb_over:TextFormat = new TextFormat();
			format_cb_over.color = 0x007DCE;
			format_cb_over.bold = true;
			
			//clear out current text in description field
			description.text = "";
			
			//Get related text for selection picked
			var var_selected:RadioButton = RadioButton(e.target);
			
			//format the Checkbox
			var_selected.setStyle("textFormat", format_cb_over);
			
			//Get the Checkbox's label
			var var_label = var_selected.label;
			
			//Find the descirption based on the Checkbox's label
			var new_text = getDescription(var_label);
			
			//Add description to text area
			description.text = new_text;
			
			
			stage.removeEventListener(MouseEvent.ROLL_OVER, changeDescription);
        }
		private function resetDescription(e:MouseEvent):void 
		{  
			//Get related text for selection picked
			var var_selected:RadioButton = RadioButton(e.target);
		
			if (var_selected.selected == false)
			{
			   //Create styles to for checkbox rollover
				var format_cb:TextFormat = new TextFormat();
				format_cb.color = 0xCCCCCC;
				
				//clear out current text in description field
				description.text = "Roll over the index on the left for a description.";
				
				//format the Checkbox
				var_selected.setStyle("textFormat", format_cb);
				
				stage.removeEventListener(MouseEvent.ROLL_OUT, changeDescription);
			}
			else
			{
				///Create styles to for checkbox selected
				var format_cb_selected:TextFormat = new TextFormat();
				format_cb_selected.color = 0xFFFFFF;
				format_cb_selected.bold = true;
				
				var_selected.setStyle("textFormat", format_cb_selected);
				var var_name = var_selected.label;
				description.text = getDescription(var_name);
			}
        }
		private function displaySelection(e:MouseEvent):void 
		{
			//Create styles to for checkbox selected
			var format_rb_selected:TextFormat = new TextFormat();
			format_rb_selected.color = 0xFFFFFF;
			format_rb_selected.bold = true;
			
			//clear out current text in description field
			description.text = "";
			
			//Get related text for selection picked
			var var_selected:RadioButton = RadioButton(e.target);
			formatUnselected(e.target.parent);

			//format the Checkbox
			var_selected.setStyle("textFormat", format_rb_selected);

			//Get the Checkbox's label
			var var_label = var_selected.label;
			
			//Find the descirption based on the Checkbox's label
			var new_text = getDescription(var_label);
			
			//Add description to text area
			description.text = new_text;
			displayPreview(var_label, e.target.parent)
        }
		
		private function getSelectedRadioButton(dispObj:*)
		{			
			for (var i:int = 0; i < dispObj.numChildren; i++)
			{
				var obj:DisplayObject = dispObj.getChildAt(i);
				if (obj is RadioButton)
				{
					var radio_selected:RadioButton = RadioButton(obj);
					if (radio_selected.selected == true)
					{
						return radio_selected.label;
					}
				}
			}
		}
		
		private function formatUnselected(dispObj:*):void
		{
			//Create Unselected format
			//Create styles to for checkbox
			var format_rb:TextFormat = new TextFormat();
			format_rb.font = "Futura Lt BT";
			format_rb.color = 0xCCCCCC;
			
			for (var i:int = 0; i < dispObj.numChildren; i++)
			{
				var obj:DisplayObject = dispObj.getChildAt(i);
				if (obj is RadioButton)
				{
					var radio_child:RadioButton = RadioButton(obj);
					if (radio_child.selected == false)
					{
						radio_child.setStyle("textFormat", format_rb);
					}
				}
			}
		}

		private function getDescription(var_name)
		{
			for each (var p in dt_radioButtons)
			{
				if (p.label == var_name)
				{
					var dt_data = p.data;
				}
			}
			return dt_data;
		}
		
		private function setup():void 
		{
			//Create new checkbox area
			var DT_Area:components_mc = new components_mc();
			DT_Area.x = 0;
			DT_Area.y = 0;
			addChild(DT_Area);
			
			//Create Description area
			//Create styles to for text area
			var format:TextFormat = new TextFormat();
			format.size = 22;
			format.font = "Futura Lt BT";
			format.color = 0xFFFFFF;
			//Create Text Area
            description = new TextField();
            description.width = 700;
            description.height = 60;
            description.x = 20;
            description.y = 45;
			description.wordWrap=true;
			description.defaultTextFormat=format;
			description.text = "Roll over the index on the left for a description.";
            DT_Area.addChild(description);
				
			//Create new radioButton container
			var RB_Area:rb_area = new rb_area();
			RB_Area.x = 40;
			RB_Area.y = 90;
			DT_Area.addChild(RB_Area);			

				
				//Create RadioButtons
				var dt_x = 0;
				var dt_y = 0;
				
				for each (var p in dt_radioButtons)
				{
					var dt_label = p.label;
					var rb:RadioButton = createRadioButton(dt_label, dt_x, dt_y);
					RB_Area.addChild(rb);
					dt_x = dt_x + 20;
				}
        }
		
		private function createRadioButton(dt_label, dt_x, dt_y)
		{
			//Create styles to for checkbox
			var format_rb:TextFormat = new TextFormat();
			format_rb.font = "Futura Lt BT";
			format_rb.color = 0xCCCCCC;
			
			var rb:RadioButton = new RadioButton();
			 	rb = new RadioButton();
         	   	rb.label = dt_label;
				rb.value = "1";
				rb.y = dt_x;
				rb.x = dt_y;
				rb.setStyle("textFormat", format_rb);
				rb.addEventListener(MouseEvent.ROLL_OVER,changeDescription);
      			rb.addEventListener(MouseEvent.ROLL_OUT,resetDescription);
				rb.addEventListener(MouseEvent.CLICK,displaySelection);
				return rb;
		}
		
		//Creates Drawing Preview Window | ScrollPane
		function displayPreview (var_label, area)
		{		
			//Document Buttons
			var dwg_Button:Button = new Button();
			var dxf_Button:Button = new Button();
			var pdf_Button:Button = new Button();
			var jpg_Button:Button = new Button();
			var tif_Button:Button = new Button();
		
			var url:String = "files/components/jpg/" + var_label + ".jpg";
			//var myScrollPane:ScrollPane = new ScrollPane();
			previewScrollPane.scrollDrag = true;
			previewScrollPane.cacheAsBitmap = true;
			previewScrollPane.setSize(MAX_SCROLLPANE_WIDTH, MAX_SCROLLPANE_HEIGHT);
			previewScrollPane.move(80, 5);
			previewScrollPane.addEventListener(Event.COMPLETE, completeHandler);
			previewScrollPane.load(new URLRequest(url));
			area.addChild(previewScrollPane);
			
			//var zoomInButton:Button = new Button();
			zoomInButton.autoRepeat = true;
			zoomInButton.enabled = false;
			zoomInButton.label = "Zoom in (+)";
			zoomInButton.move(80, 560);
			zoomInButton.addEventListener(ComponentEvent.BUTTON_DOWN, zoomInHandler);
			area.addChild(zoomInButton);
			
			//var zoomOutButton:Button = new Button();
			zoomOutButton.autoRepeat = true;
			zoomOutButton.enabled = false;
			zoomOutButton.label = "Zoom out (-)";
			zoomOutButton.move(830, 560);
			zoomOutButton.addEventListener(ComponentEvent.BUTTON_DOWN, zoomOutHandler);
			area.addChild(zoomOutButton);
			
			//Creates Format for download
			var dwnBtn_format:TextFormat = new TextFormat();
			dwnBtn_format.color = 0x000000;
			
			dwg_Button.label = ".dwg Download";
			dwg_Button.setStyle("textFormat", dwnBtn_format);
			dwg_Button.move(250, 560);
			dwg_Button.addEventListener(ComponentEvent.BUTTON_DOWN, getDocument);
			area.addChild(dwg_Button);
			
			dxf_Button.label = ".dxf Download";
			dxf_Button.setStyle("textFormat", dwnBtn_format);
			dxf_Button.move((dwg_Button.x  + dwg_Button.width + 5), 560);
			dxf_Button.addEventListener(ComponentEvent.BUTTON_DOWN, getDocument);
			area.addChild(dxf_Button);
			
			pdf_Button.label = ".pdf Download";
			pdf_Button.setStyle("textFormat", dwnBtn_format);
			pdf_Button.move((dxf_Button.x  + dxf_Button.width + 5), 560);
			pdf_Button.addEventListener(ComponentEvent.BUTTON_DOWN, getDocument);
			area.addChild(pdf_Button);
			
			jpg_Button.label = ".jpg Download";
			jpg_Button.setStyle("textFormat", dwnBtn_format);
			jpg_Button.move((pdf_Button.x  + pdf_Button.width + 5), 560);
			jpg_Button.addEventListener(ComponentEvent.BUTTON_DOWN, getDocument);
			area.addChild(jpg_Button);
			
			tif_Button.label = ".tif Download";
			tif_Button.setStyle("textFormat", dwnBtn_format);
			tif_Button.move((jpg_Button.x  + jpg_Button.width + 5), 560);
			tif_Button.addEventListener(ComponentEvent.BUTTON_DOWN, getDocument);
			area.addChild(tif_Button);
		}
		
		function getDocument(event:ComponentEvent):void
		{
			//find out which radiobutton is selected
			var fileRequested = getSelectedRadioButton(event.target.parent);
			var fileTypeRequested:String = event.target.label;
			var ext = fileTypeRequested.substring(0,4);
			var folder = fileTypeRequested.substring(1,4);
			var file_name = folder + "/" + fileRequested + ext;
			var url:String = "files/components/" + file_name;
			var request:URLRequest = new URLRequest(url);
 			navigateToURL(request, '_blank');
		}
		
		function completeHandler(event:Event):void 
		{
			zoomInButton.enabled = true;
			zoomOutButton.enabled = true;
			previewScrollPane.removeEventListener(Event.COMPLETE, completeHandler);
		}
		
		function zoomInHandler(event:ComponentEvent):void 
		{
			var zoomLvl:Number = previewScrollPane.content.scaleX * 1.1;
			updateSP(zoomLvl);
		}
		
		function zoomOutHandler(event:ComponentEvent):void 
		{
			var zoomLvl:Number = previewScrollPane.content.scaleX / 1.1;
			updateSP(zoomLvl);
		}
		
		function updateSP(newScale:Number):void 
		{
			var img:DisplayObject = previewScrollPane.content as DisplayObject;
			img.scaleY = newScale;
			img.scaleX = newScale;
			previewScrollPane.width = Math.min(img.width, MAX_SCROLLPANE_WIDTH);
			previewScrollPane.height = Math.min(img.height, MAX_SCROLLPANE_HEIGHT);
			previewScrollPane.update();
		}

	}
}