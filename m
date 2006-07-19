From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: create very large file system
Date: Wed, 19 Jul 2006 16:57:38 +0400
Message-ID: <200607191657.38644.zam@namesys.com>
References: <e9l7bh$134$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29072-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e9l7bh$134$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Mark F <mfaine@knology.net>, Ext3-users@redhat.com

On Wednesday 19 July 2006 16:10, Mark F wrote:
> Suse Linux Enterprise Server 9 SP3
>
> I've tried to create a large 5TB file system using both reiserfs and
> ext3 and both have failed.

how did they fail?

>
> I end up with only a 1.5TB file system.  Does anyone know why this
> doesn't work, what to do to fix it?

you have a single 5TB device? h/w raid, I think ?

you might need to convert the partition table to GPT format for 
supporting 2TB+ partitions.  it can be done by the gnu parted tool.

> Others have suggested that  only XFS or JFS will work.  Is this so?
>
> Thanks,
> -Mark


-- 
Alex.

