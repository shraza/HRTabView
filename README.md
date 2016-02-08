# HRTabView

let pager = PagerView(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 70), tabs: ["tab 1","tab 2","tab 3","tab 4"])
pager.delegate = self
self.view.addSubview(pager)


Implement the delegate method:

func didTapAtIndex(index: Int) {
print("tap: \(index)")
}