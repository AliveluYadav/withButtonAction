//
//  ViewController.m
//  withButtonAction
//
//  Created by Alivelu Ravula on 2/3/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//
#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createSwitches];
    
    
    
}

-(void)createSwitches{
    self.s=30;
    self.h=140;
    self.view.backgroundColor=[UIColor orangeColor];
    self.verSwitch=[[UISwitch alloc]initWithFrame:CGRectMake(10, 50, 30, 30)];
    [self.view addSubview:self.verSwitch];
    [self.verSwitch addTarget:self action:@selector(changingSwitch:) forControlEvents:UIControlEventValueChanged];
    [self.verSwitch addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];
    
    self.horzSwitch=[[UISwitch alloc]initWithFrame:CGRectMake(190, 50, 30, 30)];
    [self.view addSubview:self.horzSwitch];
    [self.horzSwitch addTarget:self action:@selector(changingSwitch:) forControlEvents:UIControlEventValueChanged];
    [self.horzSwitch addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];
    

    self.slider=[[UISlider alloc]initWithFrame:CGRectMake(10, 100, 200, 30)];
    self.slider.minimumValue=0;
    self.slider.maximumValue=30;
    self.slider.minimumTrackTintColor=[UIColor blueColor];
    self.slider.maximumTrackTintColor=[UIColor greenColor];
    [self.view addSubview:self.slider];
     [self.slider addTarget:self  action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
    
   
    
    
    self.sliderLbl=[[UILabel alloc]initWithFrame:CGRectMake(290, 90,70 , 30)];
    self.sliderLbl.backgroundColor=[UIColor whiteColor];
    self.sliderLbl.textColor=[UIColor blueColor];
    [self.view addSubview:self.sliderLbl];
    
    
    
    self.stepper=[[UIStepper alloc]initWithFrame:CGRectMake(300, 700, 30, 30)];
    self.stepper.minimumValue=0;
    self.stepper.maximumValue=30;
    self.stepper.continuous=YES;
    self.stepper.wraps=NO;
    [self.stepper addTarget:self action:@selector(changeStepper:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:self.stepper];
    
    
    self.steperLbl=[[UILabel alloc]initWithFrame:CGRectMake(20, 700,70 , 30)];
    self.steperLbl.backgroundColor=[UIColor whiteColor];
    self.steperLbl.textColor=[UIColor blueColor];
    [self.view addSubview:self.steperLbl];
    
    
    
    self.contactButtn=[UIButton buttonWithType:UIButtonTypeContactAdd];
    self.contactButtn.frame=CGRectMake(300, 10, 100, 100);
    [self.view addSubview:self.contactButtn];
    
    [self.contactButtn addTarget:self action:@selector(addCont) forControlEvents:UIControlEventTouchUpInside];
    [self.valueButtn addTarget:self  action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
    [self.valueButtn addTarget:self  action:@selector(changeSlider:) forControlEvents:UIControlEventTouchUpInside];
    [self.valueButtn addTarget:self action:@selector(addCont) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)changingSwitch:(id)sender
{
    
    UISwitch *selectedSwitch=sender;
    
    if(selectedSwitch==self.verSwitch)
    {
        if(selectedSwitch.on==YES)
        {
            [self.verSwitch setOn:YES animated:YES];
            [self.horzSwitch setOn:NO animated:YES];
        }
        
        else
        {
            
            [self.verSwitch setOn:NO animated:YES];
            [self.horzSwitch setOn:YES animated:YES];
        }}
    else
    {
        if(selectedSwitch.on==YES)
        {
            [self.horzSwitch setOn:YES animated:YES];
            // [self.verSwitch setOn:NO animated:YES];
        }
        else{
            [self.horzSwitch setOn:NO animated:YES];
            // [self.verSwitch setOn:YES animated:YES];
        }
    }
    NSLog(@"%d,%d",self.verSwitch.on,self.horzSwitch.on);
   // [self changeSlider:self.slider];
}




-(void)changeSlider:(id)sender
{
    UISlider *selectedSlider=sender;
    
    [self.sliderLbl setText:[NSString stringWithFormat:@"%d",(int)selectedSlider.value]];
    
   self.stepper.value=self.slider.value;
   
}

-(void)changeStepper:(id)sender
{
    UIStepper *selectedStepper=sender;
    


    
    [self.steperLbl setText:[NSString stringWithFormat:@"%d",(int)selectedStepper.value]];
    if(sender==self.stepper)
    {
        NSLog(@"stepper value %f",selectedStepper.value);
         self.slider.value++;
        [self.slider setValue:selectedStepper.value animated:YES];
        
        [self.slider addTarget:self action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
        [self.stepper addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];
       

       // [self changeSlider:self.slider];
        
        [self addCont];
        
    }
    else{
         self.slider.value--;
        [self.slider setValue:selectedStepper.value animated:YES];
        
        [self.slider addTarget:self action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
        [self.stepper addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];
        [self addCont];
    }
    
}
-(void)addCont
{

    self.valueButtn=[[UIButton alloc]init];
    self.valueButtn.frame= CGRectMake(self.s, self.h, 30,20 );
    self.valueButtn.backgroundColor=[UIColor whiteColor];
    self.valueButtn.backgroundColor=[UIColor blueColor];
       [self.valueButtn setTitle:[NSString stringWithFormat:@"%d",(int)self.slider.value] forState:UIControlStateNormal];
      [self.view addSubview:self.valueButtn];
    if(self.s<=300)
    {
        self.s=self.s+50;
    
    }
    else{
        self.h=self.h+30;
        self.s=30;
        
    }


    [self.valueButtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.valueButtn addTarget:self action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
    [self changeSlider:self.slider];
}

-(void)buttonAction:(id)sender
{
    
    
    self.myView1=[[UIView alloc]initWithFrame:CGRectMake(10, 200,400,490)];
    self.myView1.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.myView1];
    
    self.myView2=[[UIView alloc]initWithFrame:CGRectMake(10, 200,400,490)];
    [self.view addSubview:self.myView2];
    self.myView2.backgroundColor=[UIColor whiteColor];
    self.stepper.value=self.slider.value;
    
    
    
    int x=20,y=40;
    int a=20,b=40;
    
    
    
    for(int i=1;i<self.slider.value;i++)
    {
        if(self.verSwitch.on==YES)
        {
            

            self.slider.enabled=YES;
            self.switches=[[UISwitch alloc]initWithFrame:CGRectMake(x,y, 30, 30)];
            self.switches.thumbTintColor=[UIColor orangeColor];
           
            [self.myView1 addSubview:self.switches];
            
            if(y<=400)
            {
                y=y+50;
                
            }
            else
            {
                x=x+60;
                y=40;
            }}
       
        else if(self.horzSwitch.on==YES)
            
                   {
                       
            self.slider.enabled=YES;
        self.switches=[[UISwitch alloc]initWithFrame:CGRectMake(a,b, 30, 30)];
        self.switches.thumbTintColor=[UIColor orangeColor];
        [self.myView2 addSubview:self.switches];
        if(a<=300)
        {
            a=a+50;
        }
        else{
            b=b+50;
            a=20;
            
        }
                   }

        else if(self.verSwitch.on==YES&&self.horzSwitch.on==YES)
        {
            self.slider.enabled=NO;
        }
        else if(self.verSwitch.on!=YES&&self.horzSwitch.on!=YES)
        {
            self.slider.enabled=NO;

        }



    if(self.horzSwitch.on!=YES)
    {

        NSLog(@"Horizantal switch is off");
        [self.myView2 removeFromSuperview];
    }
    else if(self.verSwitch.on!=YES)
    {
        NSLog(@"vertical switch is off");
        [self.myView1 removeFromSuperview];
    }

}



}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
