From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Reiser4 can't compile glibc
Date: Tue, 13 Apr 2004 16:49:53 +0200 (MEST)
Message-ID: <Pine.LNX.4.21.0404131641470.22275-100000@mlf.linux.rulez.org>
References: <1081866113.1538.45.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17886-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081866113.1538.45.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com


On Tue, 13 Apr 2004, Vladimir Saveliev wrote:
>
> yes, reiser4 by default has the same time resolution as ext[23] and
> reiserfs.

Hmmm, so the kernel's nanosec timestamps can bite Reiser4 as well?

  http://groups.google.com/groups?selm=1GgcQ-4k1-17%40gated-at.bofh.it

> However, I think that i found the problem already. The attached patch
> for fs/reiser4/plugin/item/tail.c should help.

That's great :)
	
	Szaka

