//
//  WordPressDataSource.h
//  TTWordPress
//
//  Created by Karl Monaghan on 26/12/2010.
//  Copyright 2010 Crayons and Brown Paper. All rights reserved.
//

#import "TTListDataSource.h"

@class WordPressPostModel;

@interface WordPressDataSource : TTListDataSource {
	WordPressPostModel* _localModel;
}

- (id) initWithUrl:(NSString *)url;
- (id) initWithAuthorId:(NSInteger)authorId;
- (id) initWithCategoryId:(NSInteger)categoryId;
@end
