From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 segfault with one partition
Date: Tue, 1 Jun 2004 22:40:33 +0400
Message-ID: <200406012240.33075.vitaly@namesys.com>
References: <pan.2004.06.01.11.57.09.230448@unternehmen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18948-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <pan.2004.06.01.11.57.09.230448@unternehmen.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Helge Hielscher <hhielscher@unternehmen.com>, reiserfs-list@namesys.com

On Tuesday 01 June 2004 15:57, Helge Hielscher wrote:
> Hallo,

Hi,

> fsck.reiser4 segfaulted when I tried to check /dev/hda6 (see below).

which version do you have? the latest was 0.5.4 in
www.namesys.com/snapshots/2004.04.21-internal.testing.fixed/
would you try it first?

> # fsck.reiser4 /dev/hda6
>
> Fscking the /dev/hda6 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> ***** Tree Traverse Pass: scanning the reiser4 internal tree.
>         Read nodes 84931
>         Nodes left in the tree 84931
>                 Leaves of them 83682, Twigs of them 1225
>         Time interval: Tue Jun  1 07:48:12 2004 - Tue Jun  1 07:49:19 2004
> ***** TwigScan Pass: checking extent pointers of all twigs.
>         Read twigs 1225
>         Time interval: Tue Jun  1 07:49:19 2004 - Tue Jun  1 07:49:20 2004
> ***** Semantic Traverse Pass: reiser4 semantic tree checking.
> Segmentation fault

-- 
Thanks,
Vitaly Fertman

