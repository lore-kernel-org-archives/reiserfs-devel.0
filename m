From: Marc Schmitt <mschmitt@inf.ethz.ch>
Subject: Re: Bad root block 0. (--rebuild-tree did not complete)
Date: Tue, 02 Dec 2003 21:28:20 +0100
Message-ID: <3FCCF5E4.8020908@inf.ethz.ch>
References: <3FCCE7CA.7090306@inf.ethz.ch> <200312022306.49388.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16204-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200312022306.49388.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: ReiserFS-List <reiserfs-list@namesys.com>

Hi Vitaly,

Thanks for the fast answer.

Vitaly Fertman wrote:

>Hi Marc,
>
>On Tuesday 02 December 2003 22:28, Marc Schmitt wrote:
>  
>
>>Hi list,
>>
>>Attached to a Dell PE8450 (8 CPUs, 4GB RAM) we have a PowerVault 210
>>Storage with 12 70GB SCSI disks in a RAID5 container w/ spare disk
>>managed by a
>>
>>scsi2 : Found a MegaRAID controller at 0xf8853000, IRQ: 24
>>scsi2 : Enabling 64 bit support
>>megaraid: [1.73:3.27] detected 1 logical drives
>>
>>The machine is primarily running as NFS server under kernel 2.4.21 and
>>now under 2.4.23, reiserfsprogs 3.6.11. Twice already I had to run
>>`reiserfsck --rebuild-tree` this year due to weird corruption issues.
>>Since a couple of weeks (when the server was running under 2.4.21),
>>we've seen strange console output and users were claiming files had been
>>lost or they would get "permission denied" errors.
>>
>>As the output suggested, I ran reiserfsck. I don't have the log of that
>>check, but it ended suggesting to run `reiserfsck --rebuild-tree`. As I
>>said, I've done --rebuild-tree twice already over one year and there
>>were no problems so far. This time, the fsck bombed out with a
>>Segmentation Fault after running for about 10 hours. I started it again,
>>sorry, I have no log, it stopped after 10 hours of running again with a
>>Segementation Fault.
>>    
>>
>
>Would you run 
>    debugreiserfs -p /dev/problem_device | bzip2 -c > metadata.bz2
>and make it available for downloading. I will debug the problem 
>locally then.
>
It is running now. I'll make the file metadata.bz2 available for 
downloading asap. ETA is 10h, right, if the `reiserfsck --rebuild-tree` 
took 10h before it segfaulted?

>Let's try to find the problem first.
>
That gives hope... ;)

Greetz
    Marc

