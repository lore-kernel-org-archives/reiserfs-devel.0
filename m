From: kenny gorman <kgorman@panix.com>
Subject: Re: corruption?  how do I fix?
Date: Wed, 13 Nov 2002 07:02:38 -0800
Message-ID: <3DD2698E.50100@panix.com>
References: <3DD1DEEF.6030903@panix.com> <3DD2304E.70500@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11981-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

downloaded and built the latest reiserfsprogs, and ran debugreiserfs and 
reiserfsck  here is the output.. Notice the '1 round of corruption can 
be fixed msg' at the bottom.

<-------------debugreiserfs, 2001------------->
reiserfsprogs 3.x.0j
reiserfs_open: bitmap 45 was marked free
reiserfs_open: bitmap 46 was marked free
<continued until>
reiserfs_open: bitmap 67 was marked free
reiserfs_open: bitmap 68 was marked free
reiserfs_open: bitmap 69 was marked free
Super block of format 3.5 found on the 0x3 in block 16
Block count 7752704
Blocksize 4096
Free blocks 2361789
Busy blocks (skipped 16, bitmaps - 237, journal blocks - 8193
1 super blocks, 5382468 data blocks
Root block 8384
Journal block (first) 18
Journal dev 0
Journal orig size 8192
Filesystem state VALID
Tree height 4
Hash function used to sort names: "r5"
Objectid map size 2, max 1004
Version 0

reiserfsck:<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.4

   *************************************************************
   ** If you are using the latest reiserfsprogs and  it fails **
   ** please  email bug reports to reiserfs-list@namesys.com, **
   ** providing  as  much  information  as  possible --  your **
   ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
   ** messages  (including version),  the reiserfsck logfile, **
   ** check  the  syslog file  for  any  related information. **
   ** If you would like advice on using this program, support **
   ** is available  for $25 at  www.namesys.com/support.html. **
   *************************************************************

Will read-only check consistency of the filesystem on /dev/datagrp/datavol
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
###########
reiserfsck --check started at Wed Nov 13 07:00:41 2002
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Checking Semantic tree:
finished
1 found corruptions can be fixed with --fix-fixable
###########
reiserfsck finished at Wed Nov 13 07:00:48 2002
###########




Yury Umanets wrote:
> kenny gorman wrote:
> 
>> I am running a semi-large oracle database on reiserfs and lvm.  I 
>> started receiving block corruption messages in oracle.  So I started 
>> checking out the filesystem.  I ran debugreiserfs and I get the 
>> following.  Is this bad?  I can't seem to find docs on 
>> repair/restoration of reiserfs filesystems around.. am I just missing 
>> em?  We are down so any help would be really great.  Thx!
> 
> 
> First of all you have very old reiserfsprogs. The last one is:
> ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.4.tar.gz
> 
> Build this version and check you partition by fsck. What does it say?
> 
>>
>> See output of debugreiserfs:
>>
>> # debugreiserfs /dev/datagrp/datavol
>>
>> <-------------debugreiserfs, 2001------------->
>> reiserfsprogs 3.x.0j
>> reiserfs_open: bitmap 45 was marked free
>> <repeated until>
>> reiserfs_open: bitmap 69 was marked free
>> Super block of format 3.5 found on the 0x3 in block 16
>> Block count 7752704
>> Blocksize 4096
>> Free blocks 2361789
>> Busy blocks (skipped 16, bitmaps - 237, journal blocks - 8193
>> 1 super blocks, 5382468 data blocks
>> Root block 8384
>> Journal block (first) 18
>> Journal dev 0
>> Journal orig size 8192
>> Filesystem state ERROR
>> Tree height 4
>> Hash function used to sort names: "r5"
>> Objectid map size 2, max 1004
>> Version 0
>>
>>
>>
>>
>>
> 
> 



