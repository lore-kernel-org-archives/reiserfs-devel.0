From: klaus thorn <klaus@trillke.net>
Subject: Re: Status of quota support for reiserfs on 2.6.x kernels
Date: Tue, 28 Dec 2004 21:55:03 +0100
Message-ID: <20041228205503.GA17689@trillke.net>
References: <20041123105332.02470503.philippe.gramoulle@mmania.com> <200411231406.43497.christian.mayrhuber@gmx.net> <loom.20041215T011250-550@post.gmane.org> <20041215133805.GE25999@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22927-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041215133805.GE25999@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@ucw.cz>
Cc: reiserfs-list@namesys.com, edv@trillke.net

Thanks for your patch and your comments!

On Wed, Dec 15, 2004 at 02:38:06PM +0100, Jan Kara wrote:
> > I tried to use quota with 2.6.7 and got two serious problems
>   I suggest trying some newer kernel - either 2.6.10-rc3-mm1 or
> just plain 2.6.10-rc3 with attached patch applied (the patch fixes the
> deadlock you seem to hit).

It tried the latter on another server and the filesystem was accessible
at all time but other problems occured (maybe not quota-related) that made
my co-admins downgrade to 2.6.9:

1. suddenly, after running the patched kernel for days,
su, sudo and authentication through courier webmailer was not possible,
ssh-root-login went fine. After reboot problem was gone but pam_rootok.so
was missing (file system curruption?)

2. after a few hours stress-testing the quota-partition:
kernel crash: code ff 21 e2 8b 0a ...
... 76 60 e0 ff 6a 00
kernel BUG at lib/kernel_lock:120!
invalid operand: 0000

Do you think they are quota-related or related to you quota-fixall patch?

Is your fix appliable for vanilla 2.6.10 or is it already integrated or is there a newer patch?

-- 
klaus thorn     klaus@trillke.net
