From: Sebastian Kaps <seb-keyword-reiserfs.0462a0@toyland.sauerland.de>
Subject: Re: Linux 2.4 -> 2.6 migration
Date: Fri, 07 Nov 2003 17:30:25 +0100
Message-ID: <m3k76c9m5a.fsf@toyland.sauerland.de>
References: <m3ptg42t8l.fsf@toyland.sauerland.de> <3FABA80A.1090608@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16009-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FABA80A.1090608@gmx.net> (Christian Mayrhuber's message of
	"Fri, 07 Nov 2003 15:11:22 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Christian!

> Reiserfs does only metadata journaling, if you perform a hard reset the
> data newly written to your files may be lost, because it has not been
> forced onto the disk.

The problem is not that newly written data is lost but that files
suddenly have contents that belong to other files. I could live with the
loss of unsaved data but for example I hate it when my window manager
configuration is wrecked because contents that would belong to
/var/log/messages appear in its config files. I've never had this with
ext2 but quite a few times with ReiserFS.

> If you want your data to be consistent in such cases you need to apply
> Chris Mason's data logging patches, or use the SuSE Linux kernel.
> See http://ftp.suse.com/pub/people/mason

I'll try that, thank you.

-- 
Ciao, Sebastian
