class DocumentItem {
  final String icon, title, date, size;

  DocumentItem({this.icon, this.title, this.date, this.size});
}

List<DocumentItem> demoDocuments = [
  DocumentItem(
    icon: "assets/icons/xd_file.svg",
    title: "XD File",
    date: "01-03-2021",
    size: "3.5mb",
  ),
  DocumentItem(
    icon: "assets/icons/figma_file.svg",
    title: "Figma File",
    date: "27-02-2021",
    size: "19.0mb",
  ),
  DocumentItem(
    icon: "assets/icons/doc_file.svg",
    title: "Document",
    date: "23-02-2021",
    size: "32.5mb",
  ),
  DocumentItem(
    icon: "assets/icons/sound_file.svg",
    title: "Sound File",
    date: "21-02-2021",
    size: "3.5mb",
  ),
  DocumentItem(
    icon: "assets/icons/media_file.svg",
    title: "Media File",
    date: "23-02-2021",
    size: "2.5gb",
  ),
  DocumentItem(
    icon: "assets/icons/pdf_file.svg",
    title: "Sales PDF",
    date: "25-02-2021",
    size: "3.5mb",
  ),
  DocumentItem(
    icon: "assets/icons/excel_file.svg",
    title: "Excel File",
    date: "25-02-2021",
    size: "34.5mb",
  ),
];
