SELECT * FROM project.healthcare;
					----- HOSPITALITY AND PATIENTS DASHBOARD -------
                    
		                     --- KPIS ---- 
select SUM(DIS_TOT)+SUM(VIS_TOT) as Total_Patients, 
sum(DIS_TOT)  as Total_Inpatients,
sum(VIS_TOT)  as Total_Outpatients,
Sum(LIC_BEDS) as Licenced_Beds,
Sum(AVL_BEDS) as Avalable_Beds,
SUM(DAY_TOT)/SUM(DIS_TOT) as ALOS
 from healthcare;
 
 
              ----- Total discharge By Payer Type ----
Select Quarter,sum(DIS_CNTY),sum(DIS_OTH),sum(DIS_THRD),sum(DIS_MCAL),sum(DIS_MCAR),sum(DIS_INDGNT) from healthcare
group by Quarter;



				----- Total discharge By Hospital Type ----
select TYPE_HOSP,sum(dis_tot)as Total_Discharge from healthcare 
group by TYPE_HOSP
order by Total_Discharge Desc;



                ----- Impatients to Outpatients Visit ratio  ----
select Quarter,sum(DIS_TOT) as Inpatients ,sum(VIS_TOT) as Outpatients,sum(DIS_TOT) / sum(VIS_TOT) as Ratio from healthcare
group by quarter;
                
                        
                        
					----- Country WIse Hospital Count ----
select COUNTY_NAME ,count(FAC_NAME) as Total_Hospital from healthcare
group by COUNTY_NAME
order by Total_Hospital Desc;


                ----- Country WIse Hospital Count ----
select county_name,SUM(DAY_TOT)/SUM(DIS_TOT) as ALOS from healthcare
group by COUNTY_NAME
order by ALOS desc;

                ----- TYPE_CNTRL By Avalable Beds ----
select TYPE_CNTRL,sum(AVL_BEDS) As Avl_Beds from healthcare
group by TYPE_CNTRL
order by AVL_BEDS desc;
                
                

								----- HOSPITAL FINANCE DASHBOARD -------
                                -------- KPIS ------
select SUM(GROS_INPAT_REV_CC)+ SUM(GROS_OUTPAT_REV_CC) As Total_Revenue,
sum(NET_PAT_REV_CC) As Net_Patients_Revenue,
sum(VIS_TOT) As Total_Outpatients,
(SUM(NET_TOT)+SUM(OTH_OP_REV)-SUM(TOT_OP_EXP))/(SUM(NET_TOT)+SUM(OTH_OP_REV))*100 As Operating_Margin,
sum(CAP_TOT) As Total_Capital_Revenue,
SUM(TOT_OP_EXP)/(SUM(GROS_INPAT_REV_CC)+SUM(GROS_OUTPAT_REV_CC)) As Cost_To_Charge_Ratio
 from Healthcare;
 
						----- Total Revenue Trend ----
 select quarter,SUM(GROS_INPAT_REV_CC)+ SUM(GROS_OUTPAT_REV_CC) as Total_Revenue_Trend
 from healthcare
 group by quarter
 order by Total_Revenue_Trend desc; 
 

						----- Quarter Wise Operating Margin ----
select quarter,round((SUM(NET_TOT)+SUM(OTH_OP_REV)-SUM(TOT_OP_EXP))/(SUM(NET_TOT)+SUM(OTH_OP_REV))*100,2) as Operating_Margin
from healthcare
group by Quarter;


						----- Percentage Of Gross Revenue Collected ----
select quarter,concat(round(SUM(NET_TOT) / (SUM(GRIP_TOT) + SUM(GROP_TOT)) * 100,2),"%") as Percentage_Of_Gross_Revenue_Collected
from healthcare
group by quarter;


						----- Pre Tax Net Income/Loss ----
select quarter,(SUM(NET_TOT)+ SUM(OTH_OP_REV))- (SUM(TOT_OP_EXP)+SUM(NONOP_REV)) as Net_Income_loss
from healthcare
group by quarter;


						----- Total Operating Expences ----
select quarter, sum(tot_op_exp) as Total_Op_Exp from healthcare
group by quarter
order by Total_Op_Exp desc;


						----- Net Patients Revenue Per Discharge ----
 select quarter, round(SUM(NET_TOT)/SUM(DIS_TOT),2) as Net_Patient_Rev_per_Discharge
 from healthcare
 group by quarter;
 
 