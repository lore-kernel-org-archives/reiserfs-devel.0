From: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Subject: BUG IN REISERFS SLES 10 :
Date: Fri, 30 Jun 2006 11:08:58 +0530
Message-ID: <4EEB5A4713E61F49A759A504BECCBC0A0288E1AA@bgeexc01.asiapacific.cpqcorp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org


Hi Folks,

I am using SLES 10 latest beta bits. Generally I will use sg_reset
command to reset my scsi device/bus. In sles 10 the machine is not
coming up ( or in otherwords the machine is hanging)  after issuing the
sg_reset command.
I tried the following command

# sg_reset -b /dev/sg3

and also i tried with scsi ioctls, still I am facing the same problem
I tried with the following standalone program

#include<stdio.h>
   :
   :
int main(int argc, char * argv[]) {
   int fd;
   int rc;
   int arg=2;
   if ((fd=open("/dev/sg3", O_RDWR)) < 0) {
      printf( "device open fails");
      return -1;
   }
   if ((rc=ioctl(fd,SG_SCSI_RESET,&arg)) < 0 ){
     printf( " ioctl failed "); 
     close (fd);
     return -1;
   }
  
  printf ( " reset success ");
  close (fd);
  return 0;
 }


After running above program also I am facing same problem. 


Is it bug in SLES 10 or is it bug in qlogic driver ?

Thanks in advance
