From: "Alistair McDonald" <alistair@inrevo.com>
Subject: Re: Bad block 0 error
Date: Mon, 21 Jun 2004 13:10:28 +0100 (BST)
Message-ID: <35523.170.148.10.46.1087819828.squirrel@170.148.10.46>
References: <59446.170.148.10.46.1087810034.squirrel@170.148.10.46>
    <40D6CB90.7070100@namesys.com>
Reply-To: alistair@inrevo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-19284-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40D6CB90.7070100@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hello, Vladimir

Thanks for replying.
I have run with --rebuild-tree, and the results are below. Thanks for any
further help you can offer.

>>
>> A little googling suggsted using the debugreiserfs command, but the
>> output
>> seems normal to me:
>>
> No, it is not. You see: tree height is supposed to be not more than 5.
> You have 65535. Root block is block 0 which should never happen. So, you
> have to run reiserfsck --rebuild-tree

================================ reiserfsck --rebuild tree output starts
Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Mon Jun 21 13:02:36 2004
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 10081 blocks marked used
Skipping 10081 blocks (super block, journal, bitmaps) 0 blocks will be read

Could not find a hash in use. Using "r5"
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 0
                Leaves among those 0
                Objectids found 2

Pass 1 (will try to insert 0 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished

Flushing..finished
        0 leaves read
                0 inserted
####### Pass 2 #######
Flushing..finished


No reiserfs metadata found.  If you are sure that you had the reiserfs
on this partition,  then the start  of the partition  might be changed
or all data were wiped out. The start of the partition may get changed
by a partitioner  if you have used one.  Then you probably rebuilt the
superblock as there was no one.  Zero the block at 64K offset from the
start of the partition (a new super block you have just built) and try
to move the start of the partition a few cylinders aside  and check if
debugreiserfs /dev/xxx detects a reiserfs super block. If it does this
is likely to be the right super block version.
If this makes you nervous, try  www.namesys.com/support.html,  and for
$25 the author of fsck,  or a colleague  if he is out,  will  step you
through it all.

Aborted

================================ reiserfsck --rebuild tree output ends



>>
>> So, could I ask for help:  (A) was it valid to dd_rescue the old drive
>> (I
>> still have the old drive and can re-do any retrieval commands)
>
> yes. dd_rescue is the right tool.
> please keep old drive, until you have have data back
> (B) what
>> are the chances of recovering my data, and (C) how I can go about it?
>>
>
> please try
> reiserfsck --rebuild-tree /dev/md0
> amd let us know its result
>


Many thanks again,
Alistair



-- 
Alistair McDonald       (+44)(0)7017-467386
http://www.inrevo.com

