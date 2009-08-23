From: <doiggl@velocitynet.com.au>
Subject: =?UTF-8?Q?reiser=34-kmp-default-=30=2E=31=5F=32=2E=36=2E=33=31=5Frc=35=5F?=
 =?UTF-8?Q?git=33=5F=32-=32=38=2E=31=33=20and=20linux=20=32=2E=36=2E=33=31?=
 =?UTF-8?Q?-rc=36-=33-desktop=20kernel=20x=38=36=5F=36=34?=
Date: Mon, 24 Aug 2009 00:20:10 +1000
Message-ID: <99097a45fbbd301a1be32dae065cf74d@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
I tried to install reiser 4 module on kernel and got some errors.
Im using a 'Live cd' opensuse 11.2 milestone6
http://ftp5.gwdg.de/pub/opensuse/distribution/11.2-Milestone6/iso/openSUSE-KDE4-LiveCD-Build0235-x86_64.iso

# uname -a
Linux linux 2.6.31-rc6-3-desktop #1 SMP PREEMPT 2009-08-17 21:11:11 +0200
x86_64 x86_64 x86_64 GNU/Linux

I got the error message below.
Any ideas about the error
Cheers Glenn

# smart install reiser4-kmp-default-0.1_2.6.31_rc5_git3_2-28.13
Loading cache...                                                           
        
Updating cache...                                        
#################################################################################
[100%]

Computing transaction...

Installing packages (3):
  kernel-default-2.6.31-2.2@x86_64                                       
reiser4-kmp-default-0.1_2.6.31_rc5_git3_2-28.13@x86_64                  
  kernel-default-base-2.6.31-2.2@x86_64                                    
                                                                      

35.5MB of package files are needed. 137.9MB will be used.

Confirm changes? (Y/n): y

Committing transaction...                                                  
                                                                      
Preparing...                                             
#################################################################################
[  0%]
   1:Installing kernel-default-base                      
#################################################################################
[ 33%]
Output from kernel-default-base-2.6.31-2.2@x86_64:                         
                                                                      
Setting up /lib/modules/2.6.31-rc5-git3-2-default                          
                                                                      
/etc/modprobe.conf: No such file or directory                              
                                                                      
/etc/modprobe.conf.local: No such file or directory                        
                                                                      

Kernel image:   /boot/vmlinuz-2.6.31-rc5-git3-2-default
Initrd image:   /boot/initrd-2.6.31-rc5-git3-2-default 
cp: cannot stat `/etc/scsi_id.config': No such file or directory
Root device:    /dev/root (mounted on / as defaults)            
Device root not found in sysfs                                  
   2:Installing kernel-default                           
############################################################# [ 66%]
Output from kernel-default-2.6.31-2.2@x86_64:                              
                                                                      
Setting up /lib/modules/2.6.31-rc5-git3-2-default                          
                                                                      
/etc/modprobe.conf: No such file or directory                              
                                                                      
/etc/modprobe.conf.local: No such file or directory                        
                                                                      

Kernel image:   /boot/vmlinuz-2.6.31-rc5-git3-2-default
Initrd image:   /boot/initrd-2.6.31-rc5-git3-2-default 
cp: cannot stat `/etc/scsi_id.config': No such file or directory
Root device:    /dev/root (mounted on / as defaults)            
Device root not found in sysfs                                  
   3:Installing reiser4-kmp-default                      
############################################################# [100%]
Output from reiser4-kmp-default-0.1_2.6.31_rc5_git3_2-28.13@x86_64:        
                                                                      
WARNING: /lib/modules/2.6.31-rc5-git3-2-default/updates/reiser4.ko needs
unknown symbol breakpoint                                                

Kernel image:   /boot/vmlinuz-2.6.31-rc5-git3-2-default
Initrd image:   /boot/initrd-2.6.31-rc5-git3-2-default 
cp: cannot stat `/etc/scsi_id.config': No such file or directory
Root device:    /dev/root (mounted on / as defaults)            
Device root not found in sysfs                                  
error: %post(reiser4-kmp-default-0.1_2.6.31_rc5_git3_2-28.13.x86_64)
scriptlet failed, exit status 1

