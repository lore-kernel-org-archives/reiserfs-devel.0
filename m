From: Sam Vilain <sam@vilain.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Thu, 13 Feb 2003 05:09:36 +1300
Sender: Sam Vilain <sv@horo.vilain.net>
Message-ID: <200302130509.36099.sam@vilain.net>
References: <20030211144144.A5A9.MIKE@mystica.cx> <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au> <20030211171139.A5B3.MIKE@mystica.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12724-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030211171139.A5B3.MIKE@mystica.cx>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Hodson <mike@mystica.cx>
Cc: reiserfs-list@namesys.com

On Wed, 12 Feb 2003 14:02, Mike Hodson wrote:
> Well one way of being completely sure is to reset the mount count in th=
e
> filesystem before rebooting, or to set the fstab to never automatically
> fsck. then on some set  schedule, fsck along with a kernel upgrade, and
> schedule the downtime

Nah.  Set up a mirror, wait for a fairly quiet time, sync, split the=20
mirror, fsck the split mirror, and only do something if that fsck fails=20
:-).

Solaris does all this very well.  It's equivalent of `md-utils' - Online=20
Disk Suite - does journalling for you of all writes (including data) if=20
you turn it on; at the block level, ignorant of the FS.  IMHO that's a=20
much better place to do the journalling.  It's simple, solid.
--=20
Sam Vilain, sam@vilain.net

Do you have blacks, too?
 - George W. Bush, talking to Fernando Henrique Cardoso (the president
   of Brazil).  Reported in Der Speigel on May 19 2002.  Never
   reported in any US paper or news source.
