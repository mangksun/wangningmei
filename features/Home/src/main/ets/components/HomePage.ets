import { common } from '@kit.AbilityKit'
import { HttpUtils } from 'musicinfocommon'
import { MusicInfo } from 'musicinfocommon'
import { ListItemSmall } from './ListItemSmall'

@Builder
export function HomePageBuilder() {
  HomePage()
}

@Component
export struct HomePage {
  @State message: string = 'Hello World';


  pathStack: NavPathStack = new NavPathStack();
  @State httpGridItems: Array<MusicInfo> = [];
  @State pictureUri: string = '';
  private scrollerForScroll: Scroller = new Scroller();
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private applicationContext = this.context.getApplicationContext();
  private cacheDir = this.applicationContext.filesDir;
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  async aboutToAppear(): Promise<void> {
    let httpUtil: HttpUtils = new HttpUtils();
    await httpUtil.postHttpRequest().then((value: Array<MusicInfo>) => {
      this.httpGridItems = value;
    });
    await httpUtil.getHttpRequest()
    //   .then((value: string) => {
    //   this.pictureUri = value;
    // })
    ;
    httpUtil.destroyHttpRequest();
  }

  @Builder
  NavigationMenus() {
    Row() {
      SymbolGlyph($r('sys.symbol.gearshape'))
        .fontSize(24)
        .margin({ top: 14, right: 16 })
    }
  }

  build() {
    Navigation(this.pathStack) {
      // Text(this.message)
      Column() {

        Scroll(this.scrollerForScroll) {

          Column({ space: 25}) {
            ListItemSmall()
            ListItemSmall()
            ListItemSmall()
            ListItemSmall()
          }
          // .margin({ bottom: 25})
        }
      }
    }.title('主页',{
        backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
        barStyle: BarStyle.STANDARD,
      })

      .menus(this.NavigationMenus)
      .mode(NavigationMode.Auto)
      .hideToolBar(true)
      .titleMode(NavigationTitleMode.Free)
      .hideTitleBar(false)
  }
}