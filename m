From: Oleg Drokin <green@namesys.com>
Subject: Re: different block sizes and badblocks
Date: Fri, 21 Jun 2002 18:41:10 +0400
Message-ID: <20020621184110.A1190@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049BFBD5@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10777-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049BFBD5@corpusmx1.us.dg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com, newsmail@satimex.tvnet.hu

Hello!

On Fri, Jun 21, 2002 at 10:35:25AM -0400, berthiaume_wayne@emc.com wrote:

> 	How does reiserfs normally handle a bad block encountered on a read
> at this time?

I/O errro on journal read or superblock read or root node read are threatened
like mount failures.
I/O error on read in is usually handled to userspace as -EIO.

Bye,
    Oleg 
