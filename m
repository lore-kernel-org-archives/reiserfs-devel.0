From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <pgramoul@nerim.net>
Subject: Re: anyone port data-logging patches to -rc3?
Date: Fri, 23 May 2003 18:15:04 +0200
Message-ID: <20030523181504.34631d87.pgramoul@nerim.net>
References: <20030523003033.GC6586@zero>
	<20030523094633.GA1005@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14231-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030523094633.GA1005@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


Hello Oleg,

On Fri, 23 May 2003 13:46:33 +0400
Oleg Drokin <green@namesys.com> wrote:

  | Ok, replacement patches are in
  | ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/data-logging-and-quo=
ta-2.4.21-rc3/
  |=20

Patches apply fine but i have compile errors after applying the quota patch=
es for 2.4.21-rc3 starting after 07...

Says: can't find files

<linux/dqblk_xfs.h>
<linux/dqblk_v1.h>
<linux/dqblk_v2.h>

Everything is fine with -rc2 patches except that it doesn't compile because=
 of the rtnetlink_rcv_skb
unresolved symbol with gcc-3.3 which is fixed in -rc3. :)


Thanks,

Philippe

--=20

Philippe Gramoull=E9
philippe.gramoulle@mmania.com
Lycos Europe - NOC France

