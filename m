From: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 21:36:23 +0200
Message-ID: <20030806213623.C3975@bitwizard.nl>
References: <20030806182055.A28562@bitwizard.nl> <3F31303A.6020408@namesys.com> <3F314BE8.50300@suse.com> <20030806212107.A3975@bitwizard.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15200-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030806212107.A3975@bitwizard.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Cc: Jeff Mahoney <jeffm@suse.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Wed, Aug 06, 2003 at 09:21:07PM +0200, Rogier Wolff wrote:
> On Wed, Aug 06, 2003 at 02:41:44PM -0400, Jeff Mahoney wrote:
> > What is the workload that is producing the horrible slowdowns?
> 
> write at 20Mb per second into files of 1Gb each. 

P.S. We also sometimes do: 

	while (1)
	   seek to random position (in randomly chosen 1G file)
	   write 1k

we might benefit from a call that tells the filesystem:
Pretend that this file WILL grow to 1Gb, but leave it sparse for
now.

So, the block to allocate if we seek to 500Mb past the beginning of the
file would be 500Mb further along the disk. That way the eventual image
will be linear. But leaving the intermediate blocks unallocated will 
allow us to  eventually use up that free space if we DO NOT end up
writing that area. 

To get this behaviour we could

	dd if=/dev/zero of=disk.img24 bs=1024k count=1024

at the beginning, but that would use up 1Gb of disk space
right from the beginning, which in some percentage of the 
cases we don't end up using after all.... Having things go
well automatically is very important. 

			Roger. 

-- 
+-- Rogier Wolff -- www.harddisk-recovery.nl -- 0800 220 20 20 --
| Files foetsie, bestanden kwijt, alle data weg?!
| Blijf kalm en neem contact op met Harddisk-recovery.nl!
