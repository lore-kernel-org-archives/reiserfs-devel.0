From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Zero Bit found
Date: Mon, 26 Jul 2004 14:08:14 +0400
Message-ID: <4104D80E.20209@namesys.com>
References: <6913951.1090812351701.SLOX.WebMail.wwwrun@neptune.hsc-consulting.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6913951.1090812351701.SLOX.WebMail.wwwrun@neptune.hsc-consulting.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: hsimon@optusnet.com.au
Cc: reiserfs-list@namesys.com

Hello

Horst Simon wrote:
> Hi,
> 
> I recently added a 200GB Seagate IDE drive to my system on a build-in
> promise controller on an ASUS A7V, updated BIOS which supports large
> disk drives.
> The O/S is United Linux 1.0 with the latest patches and the kernel
> version is
> 2.4.21 with latest United Linux patches. The reiserfs is 3.6. During the
> initial
> setup and first reboot no reiserfsck errors are report. After writing
> data to the disk I get now following reiserfsck messages during each
> boot:
> 
>  ZERO BIT FOUND IN ON-DISK BITMAP AFTER THE LAST VALID BIT
> Switching to --fix-fixable mode
> Checking
> 
> It displays directory paths which it is checking and after finishing
> following message is displayed:
> 
> The on-disk and the correct bitmaps differ. Will be fixed later
> 
> No corruption found
> 
> There are on the filesystem:
> 
>     Leaves 20264
> 
>       Internal nodes 125
> 
>         Directories 2063
> 
>   Other files 22869
> 
>  Data block pointers 15940960 (0 of them are zero)
> 
>  Safe links 0
> 
> ###########
> 
> What is this ZERO BIT, is this a serious problem? 

No, it is not. Reiserfs manages disk space by bitmaps. Those bitmaps are stored in disk blocks.
Reiserfsck expects last bitmap to be filled by 1s in the area which address blocks out of device.
Somehow you got that padding area in last bitmap incorrectly initialized.
It is completely harmless.

What could be wrong
> bad BIOS, reiserfs, etc.?
> 

What version of reiserfsprogs you are using?


> Regards,
> Horst
> 
> 
> 
> 


