From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4
Date: Wed, 30 Jun 2004 18:32:44 +0400
Message-ID: <20040630143244.GC5080@backtop.namesys.com>
References: <1088604993.6610.5.camel@ronni.subtil.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19461-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1088604993.6610.5.camel@ronni.subtil.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ronni Nielsen <ronni_nielsen@adslhome.dk>
Cc: reiserfs-list@namesys.com

On Wed, Jun 30, 2004 at 04:16:33PM +0200, Ronni Nielsen wrote:
> I reeeeeeeeeeeeeeeeeeeeeeeeeeeeally want to test reiser4 - but i have
> this problem:
> 
> modprobe reiser4:
> FATAL: Error inserting reiser4
> (/lib/modules/2.6.7-mm4/kernel/fs/reiser4/reiser4.ko): Unknown symbol in
> module, or unknown parameter (see dmesg)
> 
> dmesg:
> ...
> reiser4: Unknown symbol __pagevec_release
> reiser4: Unknown symbol pagevec_lookup_tag
> reiser4: Unknown symbol __iget
> 
> I downloaded the 2.6.7 kernel and patched it with the 2.6.7-mm4 patch.
> Then i downloaded reiser4-2004.06.30-09.12-linux-2.6.7-mm4.diff.gz
> from http://www.namesys.com/auto-snapshots/
> 
> What is the problem???
> 
> And how can I help in testing the new filesystem?

exporting of those symbols should help to build reiser4 as a module.

-- 
Alex.
