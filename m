From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: incomplete fsck
Date: Wed, 14 Jan 2004 23:30:40 +0300
Message-ID: <200401142329.46801.vitaly@namesys.com>
References: <4005985C.5080509@bernztech.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16507-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4005985C.5080509@bernztech.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Bernick <bernz@bernztech.org>, reiserfs-list@namesys.com

Hello David, 

On Wednesday 14 January 2004 22:28, David Bernick wrote:
> I'm using kernel 2.4.23 and reiserfsck 3.6.11.
>
> I'm doing a --rebuild-tree. After pass0 i get this error. Why could this
> be?
>
> 2 directory entries were hashed with not set hash.
> 6449077 directory entries were hashed with "r5" hash.
>          "r5" hash is selected
> Flushing..finished
>          Read blocks (but not data blocks) 122328324
>                  Leaves among those 344205
>                          - corrected leaves 249
>                          - leaves all contents of which could not be saved
> and deleted 5
>                  pointers in indirect items to wrong area 1536 (zeroed)
>                  Objectids found 6449102
>
> Pass 1 (will try to insert 344200 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
> 0%pass1.c 408 pass1_correct_leaf                         left 342029, 1085
> /sec pass1_correct_leaf: block 1733582, item 36, pointer 0: The wrong
> pointer (1395601712) in the file [7068 52052]. Must be fixed on pass0.
> Aborted
>
> Thanks for any help!

hm, would you check your RAM and the harddrive?
if they are ok, would you run 
	debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
and provide it for downloading. I will check then how fsck works 
on these data on my computer.

-- 
Thanks,
Vitaly Fertman


