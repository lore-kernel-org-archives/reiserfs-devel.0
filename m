From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: kern.log unrecognized option warning
Date: Fri, 27 Aug 2004 20:58:22 +0400
Message-ID: <20040827165822.GD5108@backtop.namesys.com>
References: <1392551425.20040827154059@wp.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20922-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1392551425.20040827154059@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maciej Soltysiak <pysiak.satriani@wp.pl>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Fri, Aug 27, 2004 at 03:40:59PM +0200, Maciej Soltysiak wrote:
> Hi,
> 
> While adding an entry to fstab i tried it with reiserfs notail.
> Ok, there's no such option.
> Is it important to write this also to the kern.log?

yes. otherwise user/admin would not understand why mount fails.

> 
> Aug 26 20:27:25 dns kernel: reiser4[mount(4962)]: parse_options (fs/reiser4/vfs_ops.c:844)[nikita-2307]:
> Aug 26 20:27:25 dns kernel: WARNING: Unrecognized option: "notail"
> 
> Regards,
> Maciej
> 
> 

-- 
Alex.
