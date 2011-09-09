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

#import "EditableListDataSource.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation EditableListDataSource

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Editing support


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath*)indexPath {
  // Yes, all cells are editable.
  return YES;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)tableView:(UITableView *)tableView commitEditingStyle:
  (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  
  NSParameterAssert(indexPath.section == 0); // Only one section supported
  
  NSInteger editedRow = indexPath.row;
  
  switch (editingStyle) {
    case UITableViewCellEditingStyleDelete: // A cell was deleted
    {
      
      /* 
         The internal store of our dataSource must be up to date before we update the tableView by
         deleting cells. During the deletion of cells on the tableView it will invoke
         tableView:numberOfRowsInSection: and expects the already updated number of rows.
       */
      [self.items removeObjectAtIndex:editedRow]; // Remove the cell from our internal store
      
      NSArray* affectedIndexPaths = [NSArray arrayWithObject:indexPath];
      
      [tableView deleteRowsAtIndexPaths:affectedIndexPaths             // Update the table view,
                       withRowAnimation:UITableViewRowAnimationRight]; // remove the cell
      
      break;
    }
    default:
      NSAssert(NO, @"Unsupported editing style %i for row %i", editingStyle, editedRow);
      break;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Moving support


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
  // Yes, all our rows are movable.
  return YES;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath {
  
  NSParameterAssert(sourceIndexPath.section == 0);      // This example only fits for tableViews
  NSParameterAssert(destinationIndexPath.section == 0); // with one section
  
  NSInteger sourceRow = sourceIndexPath.row;
  NSInteger destinationRow = destinationIndexPath.row;
  
  /*
    Only update the internal store, because for moving operations the tableView has already
    rearranged the cells in it's view representation, by the time it invokes this method.
   */
   
  id theMovedObject = [self.items objectAtIndex:sourceRow];
  [self.items removeObjectAtIndex:sourceRow];
  [self.items insertObject:theMovedObject atIndex:destinationRow];
}

@end
