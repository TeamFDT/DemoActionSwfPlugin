package
{
	import fdt.FdtTextEdit;
	import swf.bridge.FdtEditorContext;
	import swf.bridge.IFdtActionBridge;
	import swf.plugin.ISwfActionPlugin;
	import flash.display.Sprite;
	import flash.utils.Dictionary;

	[FdtSwfPlugin(name="DemoActionPlugin", pluginType="action", toolTip="Demonstration of proposals")]
	public class DemoActionPlugin extends Sprite implements ISwfActionPlugin {
		[Embed(source="../assets/stop.gif", mimeType="application/octet-stream")]			
		private var _picture : Class;
		private var _bridge : IFdtActionBridge;

		public function DemoActionPlugin() {
			FdtSwfPluginIcon;
			
		}

		public function init(bridge : IFdtActionBridge) : void {
			_bridge = bridge;
			_bridge.ui.registerImage("MyCoolIcon", new _picture()).sendTo(null,null);			
		}

		public function createProposals(ec : FdtEditorContext) : void {
			
			// The call back here is 'onSelection'.
			// When the proposal is invoked (via CMD+5) the callback is execuated
			_bridge.offerProposal("MyProposalId", "MyCoolIcon", "Insert The Phrase 'Hello World'", "Description of our proposal", onSelection);		
		}

		private function onSelection(id : String, ec : FdtEditorContext) : void {
			
			// Here FDT is telling you about the context of the cursor 
//			trace(ec.currentFile);
//			trace(ec.currentLine);
//			trace(ec.currentLineOffset);
//			trace(ec.currentLineSeperator);
//			trace(ec.selectionOffset);
//			trace(ec.selectionLength);
			
//			This example will add a comment block to the top of file.
//			The key here is the 'ec.currentLineSeperator'. If it wasn't here 'package' at the top of the file would be rewritten.
//			I am inserting an edit at 0,0. This will be at the top of the file.
//			1st 0 = is the 'spot' at the very top right of the file. Play with this value to
//			see how you can change it. e.g. a '1' will place it after the 'p' in packge - it's 0 indexed.
//			2nd 0 = length of the replacement area. We're not replacing anything so it doens't matter.

//			var textEdits : Vector.<FdtTextEdit> = new Vector.<FdtTextEdit>();
//			var insertion : String = "// Comment" + ec.currentLineSeperator;
//			textEdits.push(new FdtTextEdit(0, 0, insertion));
//			_bridge.model.fileDocumentModify(ec.currentFile, textEdits).sendTo(this, null);


//***********************************

//			For next example, comment out the above code.
//			I'll change the selection length so that we properly over write 'package'
//			I'll use the length of the string 'package' (7), to make sure I ONLY overwrite package
//			Of course, nothing will seem to change because it's the same thing. Try a different word
//			 
//			var textEdits : Vector.<FdtTextEdit> = new Vector.<FdtTextEdit>();
//			var insertion : String = "package";
//			textEdits.push(new FdtTextEdit(0, insertion.length, insertion));
//			_bridge.model.fileDocumentModify(ec.currentFile, textEdits).sendTo(this, null);
//			Add this to select the edit I just made (package) right after the document is edited.
//			_bridge.editor.select(ec.currentFile, 0, insertion.length).sendTo(this,null);
			
//***********************************			
//			Here I add text where ever the cursor is
//			var textEdits : Vector.<FdtTextEdit> = new Vector.<FdtTextEdit>();
//		    var hello_world : String = "Hello World";
//		    textEdits.push(new FdtTextEdit(ec.selectionOffset,ec.selectionLength,hello_world));
//			_bridge.model.fileDocumentModify(ec.currentFile, textEdits).sendTo(this, null);
//			Use this to reposition the cursor right after 'Hello World' 
//			_bridge.editor.select(ec.currentFile, ec.selectionOffset+hello_world.length, 0).sendTo(this,null);

//***********************************

//          Of course you can send multiple edits as well. Just keep pushing into 'textEdits'
//			var textEdits : Vector.<FdtTextEdit> = new Vector.<FdtTextEdit>();
//		    var hello_world : String = "Hello World";
//		    textEdits.push(new FdtTextEdit(ec.selectionOffset,ec.selectionLength,hello_world));
//		    textEdits.push(new FdtTextEdit(ec.selectionOffset,ec.selectionLength,hello_world));
//		    textEdits.push(new FdtTextEdit(ec.selectionOffset,ec.selectionLength,hello_world));
//		    textEdits.push(new FdtTextEdit(ec.selectionOffset,ec.selectionLength,hello_world));
//			_bridge.model.fileDocumentModify(ec.currentFile, textEdits).sendTo(this, null);

		}

		public function callEntryAction(entryId : String) : void {
		}

		public function setOptions(options : Dictionary) : void {
		}

		public function dialogClosed(dialogInstanceId : String, result : String) : void {
		}
	}
}
