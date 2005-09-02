From: Matt Stegman <matts@ksu.edu>
Subject: Re: journal size reiserfs vs reiser4
Date: Fri, 2 Sep 2005 16:29:14 -0500 (CDT)
Message-ID: <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>
References: <4317FD1B.504@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25833-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4317FD1B.504@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Just to add another voice to the cachophony, I would like to be able to
select the amount.  At any time, not just at mkfs time.  For example,
ext2's reserved blocks are set by default to 5%, but I can use tune2fs to
change that to 33% or 0% or whatever makes me happy.

The point is that sometimes I care more about performance than space usage
(hard disks are cheap, blah blah) and sometimes I wish to use 100% of my
disk, even knowing that it means high fragmentation.

As far as repacking goes, I believe xfs_fsr refuses to defrag files if too
little space is free.  If it's too hard to program a repacker to operate
efficiently with only a few megabytes free, simply program it to exit with
error when less than 5% disk is free.

-- 
Matt Stegman

On Fri, 2 Sep 2005, Hans Reiser wrote:

> It could probably be a lot less than 5%, 2% is more than enough I would
> guess, but we also need to reserve space to get good performance.
>
>

