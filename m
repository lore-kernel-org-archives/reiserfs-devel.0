From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: BUG IN REISERFS SLES 10 :
Date: Fri, 30 Jun 2006 13:11:48 +0400
Message-ID: <1151658708.6499.16.camel@tribesman.namesys.com>
References: <4EEB5A4713E61F49A759A504BECCBC0A0288E1AA@bgeexc01.asiapacific.cpqcorp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4EEB5A4713E61F49A759A504BECCBC0A0288E1AA@bgeexc01.asiapacific.cpqcorp.net>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

Hello

On Fri, 2006-06-30 at 11:08 +0530, Masthan, Dudekula (STSD) wrote:
> Hi Folks,
> 
> I am using SLES 10 latest beta bits. Generally I will use sg_reset
> command to reset my scsi device/bus. In sles 10 the machine is not
> coming up ( or in otherwords the machine is hanging)  after issuing the
> sg_reset command.
> I tried the following command
> 
> # sg_reset -b /dev/sg3
> 
> and also i tried with scsi ioctls, still I am facing the same problem
> I tried with the following standalone program
> 
> #include<stdio.h>
>    :
>    :
> int main(int argc, char * argv[]) {
>    int fd;
>    int rc;
>    int arg=2;
>    if ((fd=open("/dev/sg3", O_RDWR)) < 0) {
>       printf( "device open fails");
>       return -1;
>    }
>    if ((rc=ioctl(fd,SG_SCSI_RESET,&arg)) < 0 ){
>      printf( " ioctl failed "); 
>      close (fd);
>      return -1;
>    }
>   
>   printf ( " reset success ");
>   close (fd);
>   return 0;
>  }
> 
> 
> After running above program also I am facing same problem. 
> 
> 
> Is it bug in SLES 10 or is it bug in qlogic driver ?
> 

To check whether it is filesystem problem you may want to try something
like:
mknod /ext2-mount/sg3 c 21 3
and then try your program patched with the below:
- if ((fd=open("/dev/sg3", O_RDWR)) < 0) {
+ if ((fd=open("/ext2-mount/sg3", O_RDWR)) < 0) {


> Thanks in advance
> 

