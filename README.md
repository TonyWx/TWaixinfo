# TWaixinfo
AIX System Information Gathering and Report

## SYNOPSIS
TWaixinfo only support install/managerment in System Management Interface Tool (SMIT).

**`Not support in command-line mode.`**

## DESCRIPTION
This is TWaixinfo, AIX System Information Gathering and Report. It collects various information on your AIX system and outputs it in HTML format. Since it needs root permissions to install, and control by root or normal user. It is very handy as an information source during server implementation or regulary maintenance. It is now possible to collect only the desired data, take a look at the support categories.
TWaixinfo is a shareware software which is initially provided free of charge to users, who are allowed and encouraged to make and share copies of the program.

## INSTAllATION INSTRUCTIONS
In this procedure, you will perform a new or upgrade installation TWaixinfo on a AIX system.
* 1.Log in as the root user.
* 2.Download the TWaixinfo installation package to a directory of your AIX operating system, such as /tmp/install. And then locate to the directory where the .tar.gz file exists with command such as cd /tmp/install.
* 3.Run the following commands to extract the *.tar.gz :
>` # gunzip TWaixinfo.x.x.x.x.tar.gz`

>` # tar -xvf TWaixinfo.x.x.x.x.tar`
* 4.Install the package by entering this command :
>` # cd TWaixinfo.x.x.x.x`
* 5.Run the **smit install** command. The **Software Installation and Maintenance** window opens.
* 6.Click **Install and Update Software** > **Install Software** > **INPUT device / directory for software**
* 7.Enter . in the **INPUT device/directory for software** field. 
* 8.Click **Do**.
![](https://github.com/TonyWx/TWaixinfo/blob/master/images/Install00.gif)

## Start TWaixinfo (Only support by SMIT)
This topic contains the information about managing **TWaixinfo**, including **`Run TWaixinfo`**, **`Categories Configuratio`**, **`Report Directory / E-Mail Setup`**, **`E-Mail Testing`** and **`Reset to Factory Default Settings`**.
You can perform TWaixinfo management tasks from the SMIT interface :
**# smit** > **Applications** > **System Information Report (TWaixinfo)** or Fast Path **`smit twaixinfo`**.
![](https://github.com/TonyWx/TWaixinfo/blob/master/images/Smit_twaixinfo.gif)

### RUN TWaixinfo
![](https://github.com/TonyWx/TWaixinfo/blob/master/images/Run_TWaixinfo.gif)

### Categories Configuration
> - [x]  System Information Summary 
> - [x]  System Devices Information 
> - [x]  System Storage Information 
> - [x]  FileSystem Information 
> - [x]  System Memory Consumption 
> - [x]  AIX Version & Maintenance Level Information 
> - [x]  Installed Software 
> - [x]  TCP/IP Information 
> - [x]  System Error Log Report 
> - [x]  Dump Devices Information 
> - [x]  Subsystems Information 
> - [x]  Vital Product Data (VPD) 

![](https://github.com/TonyWx/TWaixinfo/blob/master/images/Categories.gif)

### Report Directory / E-Mail Setup
> SMTP Server IP Address        => Only support IP Address (Ex: xxx.xxx.xxx.xxx)

> Report - Mail From 

> Report - Mail To

> Enable E-Mail Deliverability  => yes/no

> Report Directory

> Enable Report Save to Local   => yes/no


![](https://github.com/TonyWx/TWaixinfo/blob/master/images/EmailSetup.gif)

### E-Mail Testing
Test your SMTP Mail Server.
Use this option to send a test email message directly to your mail server - it will reveal any error messages raised by your SMTP server.

### Reset to Factory Default Settings
Resetting all Configuration to Defaults.

### Compatibility
- [x] **AIX 7.1**
- [x] **AIX 7.2**

#### Release History
- [x]  v7.1.0.0 - 2019/05/20 - New Release 
-----------------------------------------
##### AUTHOR / REPORTING BUGS
Written by TonyW`{TWx} # tonyw.1050@gmail.com
