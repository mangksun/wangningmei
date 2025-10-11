import { ListData } from '../viewmodel/ListData'

//PageOne.ets
@Builder
export function AlbumInfoPageBuilder(listData: ListData[]) {
  AlbumInfoPage({ listData });
}

@Component
export struct AlbumInfoPage {
  pathInfos: NavPathStack = new NavPathStack();
  @State listData: ListData[] = [];

  build() {
    NavDestination() {
      Column() {
        Text(`设置页面`)
          .width('100%')
          .fontSize(20)
          .fontColor(0x333333)
          .textAlign(TextAlign.Center)
          .textShadow({
            radius: 2,
            offsetX: 4,
            offsetY: 4,
            color: 0x909399
          })
          .padding({ top: 30 })
        // Text(`${JSON.stringify(this.value)}`)
        Text(``)
          .width('100%')
          .fontSize(18)
          .fontColor(0x666666)
          .textAlign(TextAlign.Center)
          .padding({ top: 45 })
        Button('返回')
          .width('50%')
          .height(40)
          .margin({ top: 50 })
          .onClick(() => {
            //弹出路由栈栈顶元素，返回上个页面
            this.pathInfos.pop();
          })
      }
      .size({ width: '100%', height: '100%' })
    }.title(``)
    .onReady((ctx: NavDestinationContext) => {
      // NavDestinationContext获取当前所在的导航控制器
      this.pathInfos = ctx.pathStack;
    })
  }
}