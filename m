From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: nfs with reiserfs and ufs on freebsd
Date: Thu, 19 Feb 2004 01:56:25 +0100
Message-ID: <20040219015625.2b7ea991@philou.gramoulle.local>
References: <20040218193033.74513.qmail@web80012.mail.yahoo.com>
	<4033C4F9.2070509@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16846-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4033C4F9.2070509@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cmc2slack-lvm@yahoo.com
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com


Hello,

If you don't use BSD flock() nor O_EXCL in a dotlocking scheme, there shouldn't be any
problem with NFS linux server and BSD client.

Ref: http://marc.theaimsgroup.com/?l=linux-nfs&m=107039404809687&w=2

Thanks,

Philippe

On Wed, 18 Feb 2004 21:03:05 +0100
Christian Mayrhuber <christian.mayrhuber@gmx.net> wrote:

  | Your information must be wrong.
  | Reiserfs works very well with nfs since a long time ago.
  | I don't know the exact kernel version but the nfs bugs
  | were ironed out in the early 2.4.x kernel series.
  | I haven't tried the combination Linux -> FreeBSD, though.
