From: Oleg Drokin <green@namesys.com>
Subject: Re: File Corruption
Date: Wed, 2 Oct 2002 10:30:55 +0400
Message-ID: <20021002103055.A16778@namesys.com>
References: <20021001101050.A5833@namesys.com> <20021002040734.30121.qmail@web10501.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11599-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021002040734.30121.qmail@web10501.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jeff leads <jleads@yahoo.com>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Oct 01, 2002 at 09:07:34PM -0700, jeff leads wrote:

> Hi!  Below is the abbreviated version of my output
> from --check.  Is it safe to run --fix-fixable?

Hm. No signs of that bad corruption your kernel was reporting.

>  What do the bad nlink numbers mean?  Should I be

These are "lost" files most probably. Bad nlink means that file have
nlink count of zero.

> concerned about the dirty buffers?

Hm. Can you get resiserfsprogs 3.6.4-pre3 from our ftp site
(ftp://ftp.namesys.com/pub/reiserfsprogs/pre) and give it a try,
if this "dirty buffers" message persists, please take metadata snapshot for us
( debugreiserfs -p /dev/your_device | gzip -9c >metadata.gz ).
Also resiserfsprogs 3.6.4-pre3 would tell you that you need
rebuild tree most probably (because now nlink number correction is only done
on rebuild-tree stage), so you would need to do rebuild-tree.

Bye,
    Oleg
