//
//  StudentSessionCell.m
//  AttendanceSystem
//
//  Created by TrungTruc on 3/3/18.
//  Copyright © 2018 TrungTruc. All rights reserved.
//

#import "StudentSessionCell.h"

@interface StudentSessionCell()

@property (weak, nonatomic) IBOutlet UILabel *lblStudentName;
@property (weak, nonatomic) IBOutlet UILabel *lblStudentId;
@property (weak, nonatomic) IBOutlet UIButton *btnAttendance;

@property (weak, nonatomic) IBOutlet UIImageView *imgFace;
@property (nonatomic) StudentModel* student;

@end

@implementation StudentSessionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadDataForCell:(StudentModel *)data withAttendanceType:(AttendanceType)type{
    
    self.lblStudentName.text = data.code;
    self.lblStudentId.text = data.name;
    self.student = data;
    
    if(type == CHECK_LIST) {
    if([self.student.status isEqualToString:@"1"])
       [self.btnAttendance setTitle:@"ABSENT" forState:UIControlStateNormal];
    else
        [self.btnAttendance setTitle:@"PRESENT" forState:UIControlStateNormal];
    }
    else if( type == FACE_DETECTION) {
        self.imgFace.image = data.face;
    }
}


- (IBAction)didTouchAttendanceButton:(id)sender {
    
    if(self.delegate)
        [self.delegate checkStudentAttendanceSession:self.student];
    
}
@end
