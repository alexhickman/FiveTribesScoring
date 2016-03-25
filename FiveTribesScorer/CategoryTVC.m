//
//  CategoryTVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 3/13/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "CategoryTVC.h"
#import "CategoryTVCell.h"
#import "CategoryHeaderTVCell.h"

@interface CategoryTVC ()
{
    NSMutableArray *pickerDataTen;
    NSMutableArray *pickerDataHundred;
    NSMutableArray *headerData;
    NSInteger category;
    CGAffineTransform rotateLeft;
    CGAffineTransform rotateRight;
}

@end

@implementation CategoryTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    rotateRight = CGAffineTransformMakeRotation(3.14/2);
    rotateRight = CGAffineTransformScale(rotateRight, 0.25, 2.0);
    
    rotateLeft = CGAffineTransformMakeRotation(-3.14/2);
    rotateLeft = CGAffineTransformScale(rotateLeft, 0.25, 2.0);
    
    UIImageView *keypad = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"keypad"]];
    pickerDataTen = [[NSMutableArray alloc]init];
    pickerDataTen = [self makeArrayOfStringsTo:10];
    [pickerDataTen addObject:keypad];
    
    pickerDataHundred = [[NSMutableArray alloc]init];
    pickerDataHundred = [self makeArrayOfStringsTo:99];
    [pickerDataHundred addObject:keypad];
    
    headerData = [[NSMutableArray alloc]init];
    headerData = [self makeArrayOfStringsTo:8];
    category = 0;
}

-(NSMutableArray *)makeArrayOfStringsTo:(int)number
{
    NSMutableArray *arrayOfNumbers = [[NSMutableArray alloc]init];
    for (int i=0; i <= number; i++)
    {
        NSString *aValue = [NSString stringWithFormat:@"%d", i];
        [arrayOfNumbers addObject:aValue];
    }
    return arrayOfNumbers;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else
    {
        return self.currentGame.numberOfPlayers;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"categoryPlayerCell";
    NSString *cellIdentifierHeader = @"categoryHeaderCell";
    if (indexPath.section == 0)
    {
        CategoryHeaderTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierHeader];
        if (!cell)
        {
            [tableView registerNib:[UINib nibWithNibName:@"CategoryHeaderTVCell" bundle:nil] forCellReuseIdentifier:cellIdentifierHeader];
            cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierHeader];
        }
        
        cell.pickerViewHeader.frame = CGRectMake(0, 0, 150, 300);
        cell.pickerViewHeader.delegate = self;
        cell.pickerViewHeader.dataSource = self;
        cell.pickerViewHeader.showsSelectionIndicator = NO;
        cell.pickerViewHeader.backgroundColor = [UIColor clearColor];
        cell.pickerViewHeader.center = CGPointMake(cell.frame.size.width/2, cell.frame.size.height/2);
//        CGAffineTransform rotate = CGAffineTransformMakeRotation(-3.14/2);
//        rotate = CGAffineTransformScale(rotate, 0.25, 2.0);
        [cell.pickerViewHeader setTransform:rotateLeft];
        cell.pickerViewHeader.center = CGPointMake(cell.pickerViewHeader.frame.size.width/2, cell.frame.size.height/2);
        cell.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
        
        return cell;
    }
    else if (indexPath.section == 1)
    {
        CategoryTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell)
        {
            [tableView registerNib:[UINib nibWithNibName:@"CategoryTVCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
            cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        }
        
        cell.pickerView.frame = CGRectMake(0, 0, 100, 200);
        cell.pickerView.delegate = self;
        cell.pickerView.dataSource = self;
        cell.pickerView.tag = indexPath.row + 1;
        cell.pickerView.showsSelectionIndicator = NO;
        cell.pickerView.backgroundColor = [UIColor clearColor];
//        CGAffineTransform rotate = CGAffineTransformMakeRotation(-3.14/2);
//        rotate = CGAffineTransformScale(rotate, 0.25, 2.0);
        [cell.pickerView setTransform:rotateLeft];
        cell.pickerView.center = CGPointMake(cell.frame.size.width - (cell.pickerView.frame.size.width/2), cell.frame.size.height/2);
        cell.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
        
        cell.labelName.text = ((Player *)self.currentGame.currentPlayers[indexPath.row]).name;
        cell.labelScore.text = [NSString stringWithFormat:@"(%li)", (long)((Player *)self.currentGame.currentPlayers[indexPath.row]).totalScore];
        
        
        if (category == 0)
        {
            [cell.pickerView selectRow:((Player *)self.currentGame.currentPlayers[indexPath.row]).gold + [pickerDataHundred count] inComponent:0 animated:YES];
        }
        else if (category == 1)
        {
            [cell.pickerView selectRow:((Player *)self.currentGame.currentPlayers[indexPath.row]).yellowVizier + [pickerDataTen count] inComponent:0 animated:YES];
        }
        else if (category == 2)
        {
            [cell.pickerView selectRow:((Player *)self.currentGame.currentPlayers[indexPath.row]).whiteElder + [pickerDataTen count] inComponent:0 animated:YES];
        }
        else if (category == 3)
        {
            [cell.pickerView selectRow:((Player *)self.currentGame.currentPlayers[indexPath.row]).djinnCardScore + [pickerDataHundred count] inComponent:0 animated:YES];
        }
        else if (category == 4)
        {
            [cell.pickerView selectRow:((Player *)self.currentGame.currentPlayers[indexPath.row]).palmTrees + [pickerDataTen count] inComponent:0 animated:YES];
        }
        else if (category == 5)
        {
            [cell.pickerView selectRow:((Player *)self.currentGame.currentPlayers[indexPath.row]).palaces + [pickerDataTen count] inComponent:0 animated:YES];
        }
        else if (category == 6)
        {
            [cell.pickerView selectRow:((Player *)self.currentGame.currentPlayers[indexPath.row]).tiles + [pickerDataHundred count] inComponent:0 animated:YES];
        }
        
        return cell;
    }
    else
    {
        NSLog(@"wah");
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }
    else
    {
        return 75;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tap tap");
}

#pragma mark - Picker view data source

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (pickerView.tag == 0)
    {
        CGRect rect = CGRectMake(0, 0, 50, 50);
        UILabel *label = [[UILabel alloc]initWithFrame:rect];
//        CGAffineTransform rotate = CGAffineTransformMakeRotation(3.14/2);
//        rotate = CGAffineTransformScale(rotate, 0.25, 2.0);
        [label setTransform:rotateRight];
        label.text = [headerData objectAtIndex:(row % [headerData count])];
        label.font = [UIFont systemFontOfSize:35.0];
        label.textAlignment = 1;
        label.textColor = [UIColor yellowColor];
        label.backgroundColor = [UIColor clearColor];
        
        label.clipsToBounds = YES;
        return label;
    }
    
    else if (category == 0 || category == 3 || category == 6)
    {
        if ((row % [pickerDataHundred count]) == ([pickerDataHundred count]-1)) {
            UIView *myView = (UIImageView *)pickerDataHundred[(row % [pickerDataHundred count])];
            [myView setFrame:CGRectMake(0, 0, 30, 30)];
//            CGAffineTransform rotate = CGAffineTransformMakeRotation(3.14/2);
//            rotate = CGAffineTransformScale(rotate, 0.25, 2.0);
            [myView setTransform:rotateRight];
            // first convert to a UIImage
            UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
            [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            // then convert back to a UIImageView and return it
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            return imageView;
        }
        else
        {
            CGRect rect = CGRectMake(0, 0, 50, 50);
            UILabel *label = [[UILabel alloc]initWithFrame:rect];
//            CGAffineTransform rotate = CGAffineTransformMakeRotation(3.14/2);
//            rotate = CGAffineTransformScale(rotate, 0.25, 2.0);
            [label setTransform:rotateRight];
            
            label.font = [UIFont systemFontOfSize:35.0];
            label.textAlignment = 1;
            label.textColor = [UIColor yellowColor];
            label.text = [pickerDataHundred objectAtIndex:(row % [pickerDataHundred count])];
            label.backgroundColor = [UIColor clearColor];
            
            label.clipsToBounds = YES;
            return label;
        }
    }
    else
    {
        if ((row % [pickerDataTen count]) == ([pickerDataTen count]-1)) {
            UIView *myView = (UIImageView *)pickerDataTen[(row % [pickerDataTen count])];
            [myView setFrame:CGRectMake(0, 0, 30, 30)];
//            CGAffineTransform rotate = CGAffineTransformMakeRotation(3.14/2);
//            rotate = CGAffineTransformScale(rotate, 0.25, 2.0);
            [myView setTransform:rotateRight];
            // first convert to a UIImage
            UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
            [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            // then convert back to a UIImageView and return it
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            return imageView;
        }
        else
        {
            CGRect rect = CGRectMake(0, 0, 50, 50);
            UILabel *label = [[UILabel alloc]initWithFrame:rect];
//            CGAffineTransform rotate = CGAffineTransformMakeRotation(3.14/2);
//            rotate = CGAffineTransformScale(rotate, 0.25, 2.0);
            [label setTransform:rotateRight];
            
            label.font = [UIFont systemFontOfSize:35.0];
            label.textAlignment = 1;
            label.textColor = [UIColor yellowColor];
            label.text = [pickerDataTen objectAtIndex:(row % [pickerDataTen count])];
            label.backgroundColor = [UIColor clearColor];
            
            label.clipsToBounds = YES;
            return label;
        }
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag == 0)
    {
        return [headerData count];
    }
    else if (category == 0 || category == 3 || category == 6)
    {
        return [pickerDataHundred count]*3;
    }
    else
    {
        return [pickerDataTen count]*3;
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == 0)
    {
        category = row;
        if (row == 7 || row == 8)
        {
            for (int i = 0; i < self.currentGame.numberOfPlayers; i++)
            {
                
            }
        }
        [self.tableView reloadData];
    }
    else if (category == 0 || category == 3 || category == 6)
    {
        //we want the selection to always be in the SECOND set (so that it looks like it has stuff before and after)
        if (row < [pickerDataHundred count] || row >= (2 * [pickerDataHundred count]) )
        {
            row = row % [pickerDataHundred count];
            row += [pickerDataHundred count];
            [pickerView selectRow:row inComponent:component animated:NO];
        }
    }
    else
        //we want the selection to always be in the SECOND set (so that it looks like it has stuff before and after)
        if (row < [pickerDataTen count] || row >= (2 * [pickerDataTen count]) )
        {
            row = row % [pickerDataTen count];
            row += [pickerDataTen count];
            [pickerView selectRow:row inComponent:component animated:NO];
        }
}

-(void)hideTheThings
{
    if (category == 7 || category == 8)
    {
        
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
