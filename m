From: Oleg Drokin <green@namesys.com>
Subject: Re: data loss with reiserfs
Date: Fri, 21 Jun 2002 22:03:04 +0400
Message-ID: <20020621220304.A859@namesys.com>
References: <200206211920.38534.JPicht85@web.de> <20020621212543.A1160@namesys.com> <200206211959.17837.JPicht85@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10786-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200206211959.17837.JPicht85@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Picht <JPicht85@web.de>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Jun 21, 2002 at 07:59:17PM +0200, Julian Picht wrote:
> > you mean
> > umount /dev/hdb3 ; reiserfsck --check /dev/hdb3
> > produces error about device being already mounted?
> Yes

> > I hope /dev/hdb3 is not your root device?
> Well... it is.

Hm. That explains why umounting fails.
You need to boot off some rescue media in order to 
check and then repair root fs (wellm to check it you may just
reboot in single-user mode)

Bye,
    Oleg
