From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: Status of quota support for reiserfs on 2.6.x kernels
Date: Tue, 23 Nov 2004 14:13:22 +0100
Message-ID: <20041123141322.698f40ac.philippe.gramoulle@mmania.com>
References: <20041123105332.02470503.philippe.gramoulle@mmania.com>
	<200411231406.43497.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22531-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411231406.43497.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: reiserfs-list@namesys.com


Hello Chris,

On Tue, 23 Nov 2004 14:06:43 +0100
Christian Mayrhuber <christian.mayrhuber@gmx.net> wrote:

  | Quotas are in kernel 2.6 and supported by ext2,ext3,reiserfs,xfs.
  | Reiserfs doesn't need an extra patch for quotas, data journalling
  | or extended attributes. Everything is right there for
  | kernels > 2.6.5 if I remember right.

Ok, good to know.

  |=20
  | Jan Kara from SuSE labs recently discoverd a deadlock in the linux
  | quota system, see:
  | http://marc.theaimsgroup.com/?t=3D110085816900002&r=3D1&w=3D2

yes saw that.

  | I guess it would be wise to wait with the migration till these patches
  | make it into some official 2.6 kernel release.

True, as mentioned in latest -mm release (2.6.10-rc2-mm3) :=20
"There's a pretty big revamp of the filesystem quota code in here.  If you
  use quotas, please test"

I 'll test in the meantime and wait for 2.6.10.

Thanks,

Philippe

--

Philippe Gramoull=E9 <philippe.gramoulle@mmania.com>
System & Network Administrator
Lycos Europe
