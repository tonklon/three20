//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "TableEditingController.h"
#import "EditableListDataSource.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TableEditingController


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    self.navigationItem.rightBarButtonItem = [self editButtonItem];
  }

  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)createModel {
  self.dataSource =
    [EditableListDataSource dataSourceWithObjects:
     [TTTableTextItem itemWithText:@"Alpha"],
     [TTTableTextItem itemWithText:@"Bravo"],
     [TTTableTextItem itemWithText:@"Charlie"],
     [TTTableTextItem itemWithText:@"Delta"],
     [TTTableTextItem itemWithText:@"Echo"],
     [TTTableTextItem itemWithText:@"Foxtrot"],
     [TTTableTextItem itemWithText:@"Golf"],
     [TTTableTextItem itemWithText:@"Hotel"],
     [TTTableTextItem itemWithText:@"India"],
     [TTTableTextItem itemWithText:@"Juliett"],
     [TTTableTextItem itemWithText:@"Kilo"],
     [TTTableTextItem itemWithText:@"Lima"],
     [TTTableTextItem itemWithText:@"Mike"],
     [TTTableTextItem itemWithText:@"November"],
     [TTTableTextItem itemWithText:@"Oscar"],
     [TTTableTextItem itemWithText:@"Papa"],
     [TTTableTextItem itemWithText:@"Quebec"],
     [TTTableTextItem itemWithText:@"Romeo"],
     [TTTableTextItem itemWithText:@"Sierra"],
     [TTTableTextItem itemWithText:@"Tango"],
     [TTTableTextItem itemWithText:@"Uniform"],
     [TTTableTextItem itemWithText:@"Victor"],
     [TTTableTextItem itemWithText:@"Whiskey"],
     [TTTableTextItem itemWithText:@"X-Ray"],
     [TTTableTextItem itemWithText:@"Yankee"],
     [TTTableTextItem itemWithText:@"Zulu"],
       nil];
}

@end
