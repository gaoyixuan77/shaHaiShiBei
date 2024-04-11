//
//  FMDBModel.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/11.
//

#import "FMDBModel.h"
#import "FMDB.h"

@interface FMDBModel ()

@property (nonatomic, strong) FMDatabase *collectionDatabase;

@end

static FMDBModel *fmdb;
@implementation FMDBModel

+ (instancetype)shareFMDB{
    if (!fmdb) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            fmdb = [FMDBModel new];
        });
    }
    return fmdb;
}

- (void)creatFMDB{
    //获取数据库文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *fileName = [docPath stringByAppendingPathComponent:@"shaHaiShiBei_new1.sqlite"];
    
    self.collectionDatabase = [FMDatabase databaseWithPath:fileName];
    
    if ([self.collectionDatabase open]) {
        //创表
        BOOL result = [self.collectionDatabase executeUpdate:@"CREATE TABLE IF NOT EXISTS collectionData (sea text NOT NULL, shall text NOT NULL, num text NOT NULL);"];
        if (result) {
            NSLog(@"创表成功");
        } else {
            NSLog(@"创表失败");
        }
    }
}

- (void)insertDataFMDBWithSea: (NSString*)sea Shall: (NSString*)shall num: (NSString*)num{
    if ([self.collectionDatabase open]) {
        BOOL result = [self.collectionDatabase executeUpdate:@"INSERT INTO collectionData (sea, shall, num) VALUES (?, ?, ?);", sea, shall, num];

        if (!result) {
            NSLog(@"增加次数失败");
        } else {
            NSLog(@"增加次数成功");
        }
    }
    [self.collectionDatabase close];
}

- (NSArray *)findDataWithSea:(NSString *)sea {
    if ([self.collectionDatabase open]) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        NSString *query = [NSString stringWithFormat:@"SELECT * FROM collectionData WHERE sea = '%@'", sea];
        FMResultSet *resultSet = [self.collectionDatabase executeQuery:query];
        while ([resultSet next]) {
            NSString *seaStr = [resultSet stringForColumn:@"sea"];
            NSString *shallStr = [resultSet stringForColumn:@"shall"];
            NSString *numStr = [resultSet stringForColumn:@"num"];
            NSDictionary *dict = @{@"sea": seaStr, @"shall": shallStr, @"num": numStr};
            [array addObject:dict];
        }
        [self.collectionDatabase close];
        return array;
    }
    return nil;
}



- (void)reloadDataWithShall: (NSString *)shall num: (NSString*)num {
    if ([self.collectionDatabase open]) {
        NSString *updateQuery = [NSString stringWithFormat:@"UPDATE collectionData SET num = ? WHERE shall = ?"];
        [self.collectionDatabase executeUpdate:updateQuery, @"num", num];
        [self.collectionDatabase close];
    }
}




@end

