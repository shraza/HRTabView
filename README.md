# HRTabView

let pager = PagerView(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 70), tabs: ["tab 1","tab 2","tab 3","tab 4"])
pager.delegate = self
self.view.addSubview(pager)


Implement the delegate method:

func didTapAtIndex(index: Int) {
print("tap: \(index)")
}

![screen shot 2016-02-08 at 11 23 51 pm](https://cloud.githubusercontent.com/assets/12963167/12894970/df344b52-cebb-11e5-9984-34e7104a2a1e.png)
