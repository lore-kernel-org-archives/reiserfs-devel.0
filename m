From: Jan Kara <jack@suse.cz>
Subject: Re: Status of quota support for reiserfs on 2.6.x kernels
Date: Tue, 23 Nov 2004 15:01:17 +0100
Message-ID: <20041123140117.GC9714@atrey.karlin.mff.cuni.cz>
References: <20041123105332.02470503.philippe.gramoulle@mmania.com> <200411231406.43497.christian.mayrhuber@gmx.net> <20041123141322.698f40ac.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22532-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041123141322.698f40ac.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe =?iso-8859-2?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

  Hello,

> On Tue, 23 Nov 2004 14:06:43 +0100
> Christian Mayrhuber <christian.mayrhuber@gmx.net> wrote:
> 
>   | 
>   | Jan Kara from SuSE labs recently discoverd a deadlock in the linux
>   | quota system, see:
>   | http://marc.theaimsgroup.com/?t=110085816900002&r=1&w=2
> 
> yes saw that.
  Actually it was discovered quite some time ago but it took me quite a
while to fix it as it needed bigger changes...

>   | I guess it would be wise to wait with the migration till these patches
>   | make it into some official 2.6 kernel release.
> 
> True, as mentioned in latest -mm release (2.6.10-rc2-mm3) : 
> "There's a pretty big revamp of the filesystem quota code in here.  If you
>   use quotas, please test"
> 
> I 'll test in the meantime and wait for 2.6.10.
  Actually the similar bugs are in 2.4 kernels so if you don't happen to
hit them there you are probably safe to try some 2.6 kernel (my quota
fixes will take some time to be tested enough to get into Linus's
tree..).

								Honza
-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs
