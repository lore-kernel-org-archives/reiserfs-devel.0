From: "B. J. Zolp" <bjzolp@wisc.edu>
Subject: Re: reiaserfsck core dumps
Date: Mon, 12 Jan 2004 12:28:53 -0600
Message-ID: <4002E765.3070201@wisc.edu>
References: <4001D0BA.5020604@wisc.edu> <200401121315.09707.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-16458-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <200401121315.09707.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com



Vitaly Fertman wrote:

>On Monday 12 January 2004 01:39, B. J. Zolp wrote:
>  
>
>>I have a LVM partition that I cannot seem to mount anymore.  Mount tells
>>me the standard "Too many mounted files systems.... " message.  So I
>>decided to run reiserfsck on it, well when i do that it soon crashes
>>with this output:
>>
>>[root@orion root]# reiserfsck /dev/vg0/logical0
>>reiserfsck, 2002 - reiserfsprogs 3.6.3
>>    
>>
>
>Please update the version of reiserfsprogs.
>  
>
Ok, I am runninf 3.6.11 now.  Still getting the same crash though, but 
new info:

The problem has occurred looks like a hardware problem.
If you have bad blocks, we advise you to get a new hard
drive, because once you get one bad block that the disk
drive internals cannot hide from your sight, the chances
of getting more are generally said to become much higher
(precise statistics are unknown to us), and this disk drive
is probably not expensive enough for you to risk your time
and data on it. If you don't want to follow that advice,
then if you have just a few bad blocks, try writing to the
bad blocks and see if the drive remaps the bad blocks (that
means it takes a block it has in reserve and allocates it
for use for requests of that block number).  If it cannot
remap the block, this could be quite bad, as it may mean
that so many blocks have gone bad that none remain in
reserve to allocate.

bread: Cannot read the block (119472128): (Input/output error).

Aborted (core dumped)

>  
>
>>Will read-only check consistency
>>of the filesystem on /dev/vg0/logical0
>>Will put log info to 'stdout'
>>
>>Do you want to run this program?[N/Yes] (note need to type Yes):Yes
>>###########
>>reiserfsck --check started at Sun Jan 11 15:19:58 2004
>>###########
>>
>>bread: Cannot read a block # 119472128.
>>    
>>
>
>Do you see anything related in the syslog? Looks like a bad block
>or an access beyond end of device.
>  
>
Syslog is giving me:

Jan 12 11:07:45 orion kernel: hdb: dma_intr: status=0x51 { DriveReady 
SeekComplete Error }
Jan 12 11:07:45 orion kernel: hdb: dma_intr: error=0x40 { 
UncorrectableError }, LBAsect=10158456, high=0, low=10158456, 
sector=10158456
Jan 12 11:07:45 orion kernel: end_request: I/O error, dev 03:40 (hdb), 
sector 10158456


I  did smartctl -a /dev/hdb and found this in the output:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE     
WHEN_FAILED RAW_VALUE

 5        Reallocated_Sector_Ct     0x0033       008           001   
063        Pre-fail       FAILING_NOW    616

If I was to dd this drive to a new one would reiserfsck be more 
cooperative?  The odd thing is that my /dev/hda gave me a the same error 
a few weeks back and used dd to copy it to a new drive and things worked 
ok again.  I find it odd that two drives would have this error within 
such a short length of time.


Well thanks for your help


>  
>
>>Aborted (core dumped)
>>
>>
>>
>>Now, I am pretty sure the LVM is intact, all the drives are added
>>correctly and all that is ok.  I ran badblocks on the partition and it
>>gave me a list of about ~1000 badblocks.  Is there a way I can use this
>>list of blocks to my advantage to recover this partition, I would like
>>to get data from it.
>>
>>
>>Thanks
>>    
>>
>
>  
>

