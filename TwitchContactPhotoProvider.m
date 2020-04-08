#import "TwitchContactPhotoProvider.h"
#import <Foundation/Foundation.h>

@implementation TwitchContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
  NSString *sender_id = [notification.applicationUserInfo valueForKeyPath:@"sender_id"];
  if (!sender_id) return nil;
  NSString *photoURLStr = [NSString stringWithFormat: @"https://api.jeffresc.dev/shortlook-twitch?id=%@", sender_id];
  NSURL *photoURL = [NSURL URLWithString:photoURLStr];
  if (!photoURL) return nil;
  return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:photoURLStr fromURL:photoURL];
}

@end
