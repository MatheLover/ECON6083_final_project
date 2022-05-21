# -*- coding: utf-8 -*-
#-----------------------------------
#raster to points then join to polygon
#-----------------------------------

#Run in ArcGIS

# Import arcpy module
import xlwt
import glob
import xlrd
import os.path
import time
import arcpy, os, sys
sys.stdout = open(os.devnull, 'w')
arcpy.CheckOutExtension('Spatial')
arcpy.env.overwriteOutput = True
arcpy.env.overwriteOutput = 1
arcpy.env.qualifiedFieldNames = False


# ————————————————————————————————————
#Set working direction (please change All paths manually to exactly where the downloaded files are stored)
working_dir = r"D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif3"
os.chdir(working_dir)
print(os.getcwd())
arcpy.env.workspace = working_dir


# read simulation list
data = xlrd.open_workbook('index.xlsx')
table = data.sheets()[1] 
periodcode = table.col_values(0)


#raster to points
i=0
for code in periodcode[1:]:
    periodstr = str(int(code))
    print(periodstr)
    if os.path.isfile("D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif3\\psimu_" + str(periodstr) + ".shp")  == False :
        try:
            inRaster ="D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif3\\simu_" + str(periodstr) + ".tif"
            outPoint ="D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif3\\psimu_" + str(periodstr) + ".shp"
            field = "VALUE"
            arcpy.RasterToPoint_conversion(inRaster, outPoint, field)
            print("successfully generated!  "), i
            i = i + 1
            time.sleep(1)
        except Exception as e:
            print(e)
            time.sleep(1)
    else:
        print("already exist"), i
        i = i + 1


#table to excel
i=0
for code in periodcode[1:]:
    periodstr = str(int(code))
    print(periodstr)
    if os.path.isfile("D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif3\\psimu_" + str(periodstr) + ".xls")  == False :
        try:
            arcpy.TableToExcel_conversion("D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif3\\psimu_" + str(periodstr) + ".shp", "D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif3\\psimu_" + str(periodstr) + ".xls")
            print("successfully generated!"), i
            i = i + 1
            time.sleep(1)
        except Exception as e:
            print(e)
            time.sleep(1)
    else:
        print("already exist"), i
        i = i + 1

# ————————————————————————————————————
#Set working direction (please change All paths manually to exactly where the downloaded files are stored)
working_dir = r"D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif4"
os.chdir(working_dir)
print(os.getcwd())
arcpy.env.workspace = working_dir


# read simulation list
data = xlrd.open_workbook('index.xlsx')
table = data.sheets()[1] 
periodcode = table.col_values(0)


#raster to points
i=0
for code in periodcode[1:]:
    periodstr = str(int(code))
    print(periodstr)
    if os.path.isfile("D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif4\\psimu_" + str(periodstr) + ".shp")  == False :
        try:
            inRaster ="D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif4\\simu_" + str(periodstr) + ".tif"
            outPoint ="D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif4\\psimu_" + str(periodstr) + ".shp"
            field = "VALUE"
            arcpy.RasterToPoint_conversion(inRaster, outPoint, field)
            print("successfully generated!  "), i
            i = i + 1
            time.sleep(1)
        except Exception as e:
            print(e)
            time.sleep(1)
    else:
        print("already exist"), i
        i = i + 1


#table to excel
i=0
for code in periodcode[1:]:
    periodstr = str(int(code))
    print(periodstr)
    if os.path.isfile("D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif4\\psimu_" + str(periodstr) + ".xls")  == False :
        try:
            arcpy.TableToExcel_conversion("D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif4\\psimu_" + str(periodstr) + ".shp", "D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif4\\psimu_" + str(periodstr) + ".xls")
            print("successfully generated!"), i
            i = i + 1
            time.sleep(1)
        except Exception as e:
            print(e)
            time.sleep(1)
    else:
        print("already exist"), i
        i = i + 1

# ————————————————————————————————————
#Set working direction (please change All paths manually to exactly where the downloaded files are stored)
working_dir = r"D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif5"
os.chdir(working_dir)
print(os.getcwd())
arcpy.env.workspace = working_dir


# read simulation list
data = xlrd.open_workbook('index.xlsx')
table = data.sheets()[1] 
periodcode = table.col_values(0)


#raster to points
i=0
for code in periodcode[1:]:
    periodstr = str(int(code))
    print(periodstr)
    if os.path.isfile("D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif5\\psimu_" + str(periodstr) + ".shp")  == False :
        try:
            inRaster ="D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif5\\simu_" + str(periodstr) + ".tif"
            outPoint ="D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif5\\psimu_" + str(periodstr) + ".shp"
            field = "VALUE"
            arcpy.RasterToPoint_conversion(inRaster, outPoint, field)
            print("successfully generated!  "), i
            i = i + 1
            time.sleep(1)
        except Exception as e:
            print(e)
            time.sleep(1)
    else:
        print("already exist"), i
        i = i + 1


#table to excel
i=0
for code in periodcode[1:]:
    periodstr = str(int(code))
    print(periodstr)
    if os.path.isfile("D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif5\\psimu_" + str(periodstr) + ".xls")  == False :
        try:
            arcpy.TableToExcel_conversion("D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif5\\psimu_" + str(periodstr) + ".shp", "D:\\Dropbox\\jinshi_backup\\Final publication file\\3 replication package\\similuation_variables_for_table_a1\\simu_tif5\\psimu_" + str(periodstr) + ".xls")
            print("successfully generated!"), i
            i = i + 1
            time.sleep(1)
        except Exception as e:
            print(e)
            time.sleep(1)
    else:
        print("already exist"), i
        i = i + 1
