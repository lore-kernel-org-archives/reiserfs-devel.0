From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 - can't find item plugin error
Date: Thu, 19 Feb 2004 23:10:13 +0300
Message-ID: <200402192310.13299.vitaly@namesys.com>
References: <47352.127.0.0.1.1077145384.squirrel@www.die.informatik.uni-siegen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16861-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <47352.127.0.0.1.1077145384.squirrel@www.die.informatik.uni-siegen.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: henning-04@die.informatik.uni-siegen.de, reiserfs-list@namesys.com

On Thursday 19 February 2004 02:03, Henning Westerholt wrote:
> Hello,

Hi Henning,

> ***** Tree Traverse Pass: scanning the reiser4 internal tree.
> Error: Can't find item plugin by its id 0x8.
> Error: Node(501): Failed to open the item(1).
> Error: Can't find item plugin by its id 0x8.
> Read Nodes...
>
>
> ****** Twig Scan:
>
> ****** Semantic Traverse Pass:
> Error: Can't find item plugin by its id 0x8.
> Time...
> Closing fs...done
>
> Operational error occured while fscking.

I failed to reproduce this on my computer. Do you use reiser4progs from 
the lastest snapshot? Would you pack the metadata of the fs and provide 
them for downloading? I will debug the problem locally then.

	debugfs.reiser4 -P /dev/hdd6 | bzip2 -c > hdd6.bz2

-- 
Thanks,
Vitaly Fertman


