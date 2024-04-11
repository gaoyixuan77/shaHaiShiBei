//
//  FMDBModel.h
//  沙海_识贝
//
//  Created by Eleven on 2024/4/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMDBModel : NSObject

+ (instancetype)shareFMDB;
- (void)creatFMDB;
- (void)insertDataFMDBWithSea: (NSString*)sea Shall: (NSString*)shall num: (NSString*)num;
- (NSArray *)findDataWithSea:(NSString *)sea;
- (void)reloadDataWithShall: (NSString *)shall num: (NSString*)num;

@end

NS_ASSUME_NONNULL_END
