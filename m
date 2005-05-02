From: Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>
Subject: Re: quota, reiserfs v3, 2.6.11.7
Date: Mon, 2 May 2005 13:07:59 +0200
Message-ID: <20050502110759.GA6381@melkor.dnp.fmph.uniba.sk>
References: <20050502083334.GA19785@melkor.dnp.fmph.uniba.sk> <200505021253.57878.bernd.schubert@pci.uni-heidelberg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23952-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200505021253.57878.bernd.schubert@pci.uni-heidelberg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: bernd-schubert@gmx.de
Cc: reiserfs-list@namesys.com

On Mon, May 02, 2005 at 12:53:57PM +0200, Bernd Schubert wrote:
> Hello Radovan,
>=20
> > Is anyone using similar setup? (reiserfs+quotas+2.6.11.7+nfs)
>=20
> our main file server is running 2.6.11.7 with reiserfs +  nfs + quota.

but probably not over RAID-1 :-)=20

> Linux hamilton1 2.6.11.7 #1 SMP Mon Apr 18 15:40:36 CEST 2005 i686 GNU/Li=
nux
>=20
> bernd@hamilton1 bernd>uptime
>  12:34:03 up 13 days, 16:40,  1 user,  load average: 0.06, 0.08, 0.11
>=20
>=20
> I have to admit that we are getting approximately one unexpected crash pe=
r=20
> month. However, we are uncertain if this is a hard- or software problem.
>=20

I set up the server last week... so it is too early to tell

> To your reiserfs problems, are you by any chance using a SIL 3114 SATA=20
> controller? We had non-memory related data corruption on disks attached t=
o=20

no, these are plain old IDE disks

thanks for the info=20

--=20
 -----------------------------------------------------------
| Radovan Garab=EDk http://kassiopeia.juls.savba.sk/~garabik/ |
| __..--^^^--..__    garabik @ kassiopeia.juls.savba.sk     |
 -----------------------------------------------------------
Antivirus alert: file .signature infected by signature virus.
Hi! I'm a signature virus! Copy me into your signature file to help me spre=
ad!
