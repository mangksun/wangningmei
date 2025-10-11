

import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { fileIo, fileUri } from '@kit.CoreFileKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

import json from '@ohos.util.json';
import { SongItem } from '../viewmodel/SongItem';
import { UrlResponse } from '../viewmodel/UrlResponse';
import { Lyric } from '../viewmodel/Lyric';

const TAG: string = 'HttpUtils';


/**
 * The HttpUtils provides the capability of accessing the network through HTTP.
 */
export class HttpUtils {
  httpRequest: http.HttpRequest;
  targetUrl: string = '';
  curMusicSource: string = '';
  url_id: string = '';



  constructor() {
    this.httpRequest = http.createHttp();
  }

  /**
   * The method of a GET request through HTTP.
   */
    async httpSearchRequest(): Promise<MusicInfo[] | undefined > {
      let responseSongList: Array<MusicInfo> | undefined;
      await this.httpRequest.request(this.targetUrl, { method: http.RequestMethod.GET })
        .then((data: http.HttpResponse) => {
          console.log("Get Result Successfully" + JSON.stringify(data.result));
          // let songs = JSON.stringify(data.result) as Array<MusicInfo>
          responseSongList = JSON.parse(data.result as string);
          return responseSongList;
        })
        .catch((err: Error) => {
          hilog.info(0x0000, TAG, JSON.stringify(err));
        });
      return responseSongList;
    }


  /**
   * The method of a GET request through HTTP.
   */
  async httpUrlRequest(): Promise<string> {
    let AudioUrl: string = '';
    let RequestUrl: string = 'https://music-api.gdstudio.xyz/api.php?types=url&br=999' +'&source=' + this.curMusicSource + '&id=' + this.url_id;
    await this.httpRequest.request(RequestUrl, { method: http.RequestMethod.GET })
      .then((data: http.HttpResponse) => {
        console.log("Get Result Successfully" + JSON.stringify(data.result));
        // let songs = JSON.stringify(data.result) as Array<MusicInfo>

        let tempUrl: UrlResponse = JSON.parse(data.result as string);
        AudioUrl = tempUrl.url;
        return AudioUrl;
      })
      .catch((err: Error) => {
        hilog.info(0x0000, TAG, JSON.stringify(err));
      });
    return AudioUrl;
  }


  /**
   * The method of a GET request through HTTP.
   */
  async httpPicUrlRequest(): Promise<string> {
    let PictureUrl: string = '';
    let RequestUrl: string = 'https://music-api.gdstudio.xyz/api.php?types=pic&size=500' +'&source=' + this.curMusicSource + '&id=' + this.url_id;
    await this.httpRequest.request(RequestUrl, { method: http.RequestMethod.GET })
      .then((data: http.HttpResponse) => {
        console.log("Get Result Successfully" + JSON.stringify(data.result));
        let tempUrl: UrlResponse = JSON.parse(data.result as string);
        PictureUrl = tempUrl.url;
      })
      .catch((err: Error) => {
        hilog.info(0x0000, TAG, JSON.stringify(err));
      });
    return PictureUrl;
  }
/**
   * The method of a GET request through HTTP.
   */
  async httpLyricRequest(): Promise<Lyric> {
    let lyric: Lyric = new Lyric('','')
    let RequestUrl: string = 'https://music-api.gdstudio.xyz/api.php?types=lyric' +'&source=' + this.curMusicSource + '&id=' + this.url_id;
    await this.httpRequest.request(RequestUrl, { method: http.RequestMethod.GET })
      .then((data: http.HttpResponse) => {
        console.log("Get Result Successfully" + JSON.stringify(data.result));
        lyric = JSON.parse(data.result as string);
      })
      .catch((err: Error) => {
        hilog.info(0x0000, TAG, JSON.stringify(err));
      });
    return lyric;
  }



  /**
   * The method of initiating a POST request through HTTP.
   */
  // async postHttpRequest(): Promise<MusicInfo[]> {
  //   let responseData: Array<MusicInfo> = [];
  //   await this.httpRequest.request(RESOURCE_URL,
  //     {
  //       method: http.RequestMethod.POST, extraData: {
  //       'types':'search',
  //       'source':'kuwo',
  //       'count':'1',
  //       'name':'晴天'
  //     },
  //       header: new Header('application/json;charset=UTF-8')
  //     }).then((data: http.HttpResponse) => {
  //     let result: ResponseData = JSON.parse(data.result as string);
  //     responseData = result.value.list;
  //     console.log("Response: " + data.result as string);
  //   }).catch((err: Error) => {
  //     hilog.info(0x0000, TAG, JSON.stringify(err));
  //   });
  //   return responseData;
  // }

  /**
   * The method of destroying httpRequest.
   */
  destroyHttpRequest() {
    this.httpRequest.destroy();
  }
}