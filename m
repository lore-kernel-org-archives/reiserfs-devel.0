From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiserfs corruption problem.
Date: Tue, 2 Mar 2004 13:15:11 +0300
Message-ID: <200403021304.58351.vitaly@namesys.com>
References: <200403021035.45201.bon@teamlog.Fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403021035.45201.bon@teamlog.Fr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jean-Michel Bonnefond <bon@teamlog.Fr>, reiserfs-list@namesys.com

On Tuesday 02 March 2004 12:35, Jean-Michel Bonnefond wrote:
> Hi all,
>
> I have a 40Go ide disk that is mounted with one big partition containing
> all my clients datas on a linux debian woody. I was working as usual on the
> server when I suddenly couldn't no more list the contents of the root mount
> point (/part) but could continue working and looking into the files all
> under the root, (/part/distrib) and can cd into all the sub-directories. I
> just can't access to the root partition contents with an error message that
> I unfortunately haven't keep.
>
> I decide to reboot the server in order to plug another ide disk to copy all
> data to this disk but, as soon as I umount the disk, I was unable to
> remount it. It replies me :
> mount: is not a repertory (traduction of the french error message).
>
> The reiserfsck do reply :
>
> root@interne:~# reiserfsck /dev/hdc1
> <--------reiserfsck 3.6.4, 2002-------->
>
> Will read-only check consistency of the filesystem on /dev/hdc1
> Will put log info to 'stdout'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
>
> ******************************************************
> * Warning: The dma on your hard drive is turned off. *
> * This may really slow down the fsck process.        *
> ******************************************************
> ###########
> reiserfsck --check started at Tue Mar  1 15:19:46 2004
> ###########
> Replaying journal..
> 0 transactions replayed
> Checking internal tree../  1 (of   2)bad_internal: vpf-10320: block 8384,
> items 5 and 6: The wrong order of items: [2 2310 0x52a2001 IND (1)], [0
> 2311 0x69db001 IND (1)]
>  the problem in the internal node occured (8384), whole subtree is skipped
> finished
> Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
> Bad nodes were found, Semantic pass skipped
> 1 found corruptions can be fixed only during --rebuild-tree
> ###########
> reiserfsck finished at Tue Mar  2 10:20:00 2004
> ###########
> root@interne:~#
>
> So I does a dd_rescue of the disk to another one wich hadn't notice any
> hardware problem, all the physical disk can be acceseed well.
> and then I launch a --rebuild-tree.
>
> The first stage seem to pass correctly but the second pass loop infinitely
> on message :
>
> do_pass_2: The block (level=28869, nr_item=905, free_space=49895 rdkey),
> marked as a leaf on the first two passe, is not a leaf! Will be skipped.
>
>
> So do you have any suggestion on what I can do now and how I can acces
> again to my datas, even temporarily to copy them eslewhere?

Obtain the latest reiserfsprogs from our ftp site and try it again please.

-- 
Thanks,
Vitaly Fertman
