import java.awt.datatransfer.DataFlavor;  
import java.awt.datatransfer.Transferable;  
import java.awt.datatransfer.UnsupportedFlavorException;  
import java.awt.dnd.DnDConstants;  
import java.awt.dnd.DropTarget;  
import java.awt.dnd.DropTargetDragEvent;  
import java.awt.dnd.DropTargetDropEvent;  
import java.awt.dnd.DropTargetEvent;  
import java.io.File;  
import java.io.IOException;  


void dropTaret_settings() {
  dropTarget = new DropTarget(((java.awt.Component) this.surface.getNative()), new ImageDropTargetListener());
  // ==================================================
}

class ImageDropTargetListener implements java.awt.dnd.DropTargetListener {
  @Override
    void dragEnter(DropTargetDragEvent dtde) {
  }

  @Override
    public void dragOver(DropTargetDragEvent dtde) {
  }  

  @Override
    public void dropActionChanged(DropTargetDragEvent dtde) {
  }  

  @Override
    public void dragExit(DropTargetEvent dte) {
  }  

  @Override
    public void drop(DropTargetDropEvent dtde) {
    dtde.acceptDrop(DnDConstants.ACTION_COPY_OR_MOVE);
    Transferable trans = dtde.getTransferable();  
    java.util.List<File> fileNameList = null;  
    if (trans.isDataFlavorSupported(DataFlavor.javaFileListFlavor)) {  
      try {  
        fileNameList = (java.util.List<File>)  
          trans.getTransferData(DataFlavor.javaFileListFlavor);
      } 
      catch (UnsupportedFlavorException ex) {  
        /* 例外処理 */
      } 
      catch (IOException ex) {  
        /* 例外処理 */
      }
    }  
    if (fileNameList == null) return;  
    if (fileNameList.size() != 1) {
      warningDialog("2つ以上のファイル操作に対応していません", "multiple files is dropped");
      return;
    }
    imgOpen(fileNameList.get(0).getAbsolutePath());
  }
}