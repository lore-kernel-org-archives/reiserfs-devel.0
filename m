From: Christoph Hellwig <hch@lst.de>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 00:05:46 +0200
Message-ID: <20040826220546.GA12401@lst.de>
References: <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org> <412DAC59.4010508@namesys.com> <1093548414.5678.74.camel@krustophenia.net> <20040826203017.GA14361@school.ioffe.ru> <1093552692.13881.43.camel@leto.cs.pocnet.net> <16686.22336.829096.678178@thebsh.namesys.com> <1093556818.13881.75.camel@leto.cs.pocnet.net> <16686.24120.761440.969273@thebsh.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20823-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16686.24120.761440.969273@thebsh.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Dmitry Baryshkov <mitya@school.ioffe.ru>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

On Fri, Aug 27, 2004 at 02:03:36AM +0400, Nikita Danilov wrote:
>  > What about fs/reiser4/plugin/node/ and fs/reiser4/plugin/disk_format/?
>  > 
>  > Of course you can implement another filesystem inside the plugins but
>  > they wouldn't use fs/reiser4/*.c, so this would be rather stupid. Right?
>  > 
> 
> That was the message of my message.

And I think Christophe and me already agreed in this thread that these
upper level plugin facility should go away before merge anyway.  We made
the mistake of not requesting removel of that one for XFS and now SGI
blocks it's removal.

