From: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 19:22:27 +0200
Message-ID: <20030806192227.B31496@bitwizard.nl>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15182-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030806164852.GA14719@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Wed, Aug 06, 2003 at 08:48:52PM +0400, Oleg Drokin wrote:

> reiserfsck --rebuild-tree is special, it actually reads in all the
> blocks on the device that are marked as used, to find metadata
> blocks and connect them to the tree (even if they were previously
> unconnected).  Unlike many other filesystems out there, reiserfs
> does not have fixed metadata locations, hence we absolutely need
> this scan.
> > later. So we hit control-C on the fsck.
> 
> That was big mistake.

Well, I forgot to say this in my last Email: but it's a big mistake
for "--rebuild-tree" to START by writing to the filesystem. As for a
large (and full) filesystem it is going to take HOURS to read the
whole thing, the first write to the filesystem should happen AFTER
reading all the datablocks.

			Roger. 

-- 
+-- Rogier Wolff -- www.harddisk-recovery.nl -- 0800 220 20 20 --
| Files foetsie, bestanden kwijt, alle data weg?!
| Blijf kalm en neem contact op met Harddisk-recovery.nl!
