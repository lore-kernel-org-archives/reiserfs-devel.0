From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Bad block 0 error
Date: Mon, 21 Jun 2004 16:45:00 +0400
Message-ID: <40D6D84C.5080408@namesys.com>
References: <59446.170.148.10.46.1087810034.squirrel@170.148.10.46>    <40D6CB90.7070100@namesys.com> <35523.170.148.10.46.1087819828.squirrel@170.148.10.46>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19285-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <35523.170.148.10.46.1087819828.squirrel@170.148.10.46>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: alistair@inrevo.com
Cc: reiserfs-list@namesys.com

Hello

Alistair McDonald wrote:
> Hello, Vladimir
> 
> Thanks for replying.
> I have run with --rebuild-tree, and the results are below. Thanks for any
> further help you can offer.
> 
> 
>>>A little googling suggsted using the debugreiserfs command, but the
>>>output
>>>seems normal to me:
>>>
>>
>>No, it is not. You see: tree height is supposed to be not more than 5.
>>You have 65535. Root block is block 0 which should never happen. So, you
>>have to run reiserfsck --rebuild-tree
> 
> 
> ================================ reiserfsck --rebuild tree output starts
> Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
> Replaying journal..
> Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Mon Jun 21 13:02:36 2004
> ###########
> 
> Pass 0:
> ####### Pass 0 #######
> Loading on-disk bitmap .. ok, 10081 blocks marked used
> Skipping 10081 blocks (super block, journal, bitmaps) 0 blocks will be read
> 
> Could not find a hash in use. Using "r5"
>         "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 0
>                 Leaves among those 0
>                 Objectids found 2
> 
> Pass 1 (will try to insert 0 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
> 
> Flushing..finished
>         0 leaves read
>                 0 inserted
> ####### Pass 2 #######
> Flushing..finished
> 
> 
> No reiserfs metadata found.  If you are sure that you had the reiserfs
> on this partition,  then the start  of the partition  might be changed

Lets try to see if there are reiserfs metadata on /dev/md0:

echo "\n" | 3.6.17/debugreiserfs -k -S -q /dev/md0 | head 10000

It should output something like:
block 17775 is reiserfs leaf node

If you do not see such lines - reiserfsck can not do anything with that 
device.

please also run
debugreiserfs -m /dev/md0 > md0.bitmap
and send us md0.bitmap

