From: Bernd Schubert <bernd.schubert@pci.uni-heidelberg.de>
Subject: Re: quota, reiserfs v3, 2.6.11.7
Date: Mon, 2 May 2005 12:53:57 +0200
Message-ID: <200505021253.57878.bernd.schubert@pci.uni-heidelberg.de>
References: <20050502083334.GA19785@melkor.dnp.fmph.uniba.sk>
Reply-To: bernd-schubert@gmx.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23951-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050502083334.GA19785@melkor.dnp.fmph.uniba.sk>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hello Radovan,

> Is anyone using similar setup? (reiserfs+quotas+2.6.11.7+nfs)

our main file server is running 2.6.11.7 with reiserfs +  nfs + quota.

Linux hamilton1 2.6.11.7 #1 SMP Mon Apr 18 15:40:36 CEST 2005 i686 GNU/Linux

bernd@hamilton1 bernd>uptime
 12:34:03 up 13 days, 16:40,  1 user,  load average: 0.06, 0.08, 0.11


I have to admit that we are getting approximately one unexpected crash per=
=20
month. However, we are uncertain if this is a hard- or software problem.

To your reiserfs problems, are you by any chance using a SIL 3114 SATA=20
controller? We had non-memory related data corruption on disks attached to=
=20
this controller. This problem might come from the harddisk, since we are=20
getting CRC error messages ever since we attached those disks to an=20
additional promise controller

ata1: status=3D0x51 { DriveReady SeekComplete Error }
ata1: error=3D0x84 { DriveStatusError BadCRC }
ata2: status=3D0x51 { DriveReady SeekComplete Error }
ata2: error=3D0x84 { DriveStatusError BadCRC }

At least there doesn't seem to happen a hidden data corruption.


Bernd


=2D-=20
Bernd Schubert
Physikalisch Chemisches Institut / Theoretische Chemie
Universit=E4t Heidelberg
INF 229
69120 Heidelberg
e-mail: bernd.schubert@pci.uni-heidelberg.de
