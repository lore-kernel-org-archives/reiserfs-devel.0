From: Brian Davis <bridavis@comcast.net>
Subject: Re: Need help retrieving data
Date: Fri, 25 Aug 2006 10:22:33 -0400
Message-ID: <44EF07A9.3080100@comcast.net>
References: <44EDE55E.7030106@comcast.net> <44EE0F5F.1040009@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29690-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44EE0F5F.1040009@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, reiserfs-dev <reiserfs-dev@namesys.com>, Alexander Zarochentcev <zam@namesys.com>

Do you guys think that a rebuild-tree will fix this problem?

Hans Reiser wrote:
> I am very sorry to inform you that our fsck guy is on vacation, and we
> have no effective backup for him.
>
> Hans
>
> Brian Davis wrote:
>   
>> Hello,
>>
>> I've paid the 25 dollars, but I haven't gotten a response yet so I'm
>> trying this list....
>>
>> I have a disk which has a single partition with reiserfs version 3 on it.
>>
>> One day I put the disk on a 3Ware 7506-4LP RAID controller card and
>> tried to mount the partition through the normal mechanisms. (mount -t
>> xfs /dev/..). It was not part of a RAID array, it was just setup as a
>> single disk on the controller.
>>
>> When I did this, mount hung for what seemed to be a long time and then
>> Seg Faulted.  Since then I have not been able to mount the partition
>> on either the RAID controller or a normal IDE controller.
>>
>> I get the following error when trying to mount:
>>
>> localhost ~ # mount -t reiserfs /dev/hde1 /stuff
>> mount: wrong fs type, bad option, bad superblock on /dev/hde1,
>>      missing codepage or other error
>>      In some cases useful info is found in syslog - try
>>      dmesg | tail  or so
>>
>> Checking /var/log/messages reveals the following:
>>
>> ReiserFS: hde1: found reiserfs format "3.6" with standard journal
>> ReiserFS: hde1: using ordered data mode
>> ReiserFS: hde1: journal params: device hde1, size 8192, journal first
>> block 18, max trans len 1024, max batch 900, max commit age 30, max
>> trans age 30
>> ReiserFS: hde1: checking transaction log (hde1)
>> ReiserFS: hde1: warning: vs-7000: search_by_entry_key: search_by_key
>> returned item position == 0
>>
>> I then run reiserfsck, which doesn't find any errors:
>>
>> localhost ~ # reiserfsck /dev/hde1
>> reiserfsck 3.6.19 (2003 www.namesys.com)
>>
>> *************************************************************
>> ** If you are using the latest reiserfsprogs and  it fails **
>> ** please  email bug reports to reiserfs-list@namesys.com, **
>> ** providing  as  much  information  as  possible --  your **
>> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
>> ** messages  (including version),  the reiserfsck logfile, **
>> ** check  the  syslog file  for  any  related information. **
>> ** If you would like advice on using this program, support **
>> ** is available  for $25 at  www.namesys.com/support.html. **
>> *************************************************************
>>
>> Will read-only check consistency of the filesystem on /dev/hde1
>> Will put log info to 'stdout'
>>
>> Do you want to run this program?[N/Yes] (note need to type Yes if you
>> do):Yes
>> ###########
>> reiserfsck --check started at Tue Aug 22 19:21:46 2006
>> ###########
>> Replaying journal..
>> Reiserfs journal '/dev/hde1' in blocks [18..8211]: 0 transactions
>> replayed
>> Checking internal tree..finished                             
>> Comparing bitmaps..finished
>> Checking Semantic tree:
>> finished                                                                      
>>
>> No corruptions found
>> There are on the filesystem:
>>       Leaves 40825
>>       Internal nodes 270
>>       Directories 2351
>>       Other files 34336
>>       Data block pointers 34474385 (536372 of them are zero)
>>       Safe links 0
>> ###########
>> reiserfsck finished at Tue Aug 22 19:26:56 2006
>> ###########
>>
>> Trying to mount again after running reiserfsck still results in the
>> same error as above.
>>
>> I'm at a loss for the next steps to take, I'm hoping you can help be
>> get my data back from this drive/partition.
>>
>> Thanks,
>> Brian
>>
>>
>>
>>
>>
>>     
>
>
>   
