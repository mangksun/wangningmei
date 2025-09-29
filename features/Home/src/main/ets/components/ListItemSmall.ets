import { ListData } from 'musicinfocommon'




// @Entry
@Component
export struct ListItemSmall {
  private listData: Array<ListData> = [
    // new ListData('ムリムリ進化論', 'ムリムリ進化論 - EP', 'Nanawoakari', 'app.media.jinhua'),
    // new ListData('恋愛脳 / 陽傘', '恋愛脳', 'Nanawoakari', 'app.media.jinhua'),
    // new ListData('Plagiarism', 'Escape', 'Yorushika', 'app.media.Plagiarism'),
    new ListData('铃芽之旅', 'Suzume(feat.Toaka)', 'RADWIMPS', 'app.media.gaomu'),
    new ListData('铃芽之旅1', 'Suzume(feat.Toaka)', 'RADWIMPS', 'app.media.gaomu'),
    new ListData('铃芽之旅2', 'Suzume(feat.Toaka)', 'RADWIMPS', 'app.media.gaomu'),
    new ListData('铃芽之旅3', 'Suzume(feat.Toaka)', 'RADWIMPS', 'app.media.gaomu'),
    new ListData('铃芽之旅4', 'Suzume(feat.Toaka)', 'RADWIMPS', 'app.media.gaomu'),
  ]

  // @Builder
  // ListItemSmall() {
  //
  //
  // }


  build() {
      List({space: '-10vp'}){
        ForEach(this.listData, (item: ListData) => {
          ListItem() {
            Column(){
              Image($r(item.pic))
                .width('160vp')
                .height('160vp')
                .objectFit(ImageFit.Contain)
                .borderRadius('12vp')
                // .margin({ left: '12vp' })
              Column(){
                Text(item.name)
                  .fontSize('18vp')
                  .fontColor(Color.Black)
                // .textAlign(TextAlign.Start)
                Text(item.artist)
                  .fontSize('13vp')
                  .fontColor(Color.Gray)
              }
              .height(31)
              .alignItems(HorizontalAlign.Start)
              .margin({top: '8vp'})

            }.height('100%')
            .width('40%')
            .alignItems(HorizontalAlign.Start)
            // .justifyContent(FlexAlign.SpaceBetween)

          }.height('100%')
          .margin({ left: '20vp', right: '20vp'})
        }, (item: ListData) => JSON.stringify(item))
          // .padding({ left: 24, right: 24 })
      }
      .edgeEffect(EdgeEffect.None)
      .listDirection(Axis.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')
      .height(210)
      // .padding({ left: 24, right: 24 })
      // .margin({ top: '12vp' ,left: '12vp'})
      // .alignListItem(ListItemAlign.End)
    }
}
