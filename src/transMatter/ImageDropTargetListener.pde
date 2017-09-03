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

class ImageDropTargetListener implements java.awt.dnd.DropTargetListener {
  @Override
    void dragEnter(DropTargetDragEvent dtde) {
    fileDragged = true;
  }

  @Override
    public void dragExit(DropTargetEvent dte) {
    fileDragged = false;
  }

  @Override
    public void drop(DropTargetDropEvent dtde) {
    dtde.acceptDrop(DnDConstants.ACTION_COPY_OR_MOVE);
    Transferable trans = dtde.getTransferable();
    java.util.List<File> fileNameList = null;
    if (trans.isDataFlavorSupported(DataFlavor.javaFileListFlavor)) {
      try {
        fileNameList = (java.util.List<File>) trans.getTransferData(DataFlavor.javaFileListFlavor);
      }
      catch (UnsupportedFlavorException e) {
        warningDialog("ドロップされたファイル形式は無効です", "unsupported file exception");
        return;
      }
      catch (IOException e) {
        warningDialog("ファイルの読み込みに失敗しました", "file drop exception");
        return;
      }
    }
    if (fileNameList == null) return;
    if (fileNameList.size() != 1) {
      warningDialog("2つ以上のファイル操作に対応していません", "multiple files is dropped");
      return;
    }
    imgOpen(fileNameList.get(0).getAbsolutePath());
    fileDragged = false;
  }

  @Override
    public void dragOver(DropTargetDragEvent dtde) {
  }

  @Override
    public void dropActionChanged(DropTargetDragEvent dtde) {
  }
}