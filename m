From: Thorsten Mauch <mauch@imkenberg.de>
Subject: AW: rebuildfs
Date: Tue, 5 Aug 2003 19:42:51 +0200
Message-ID: <E5A63F34D141D111A6F4080009D70ACA346D68@imkedv_pdc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15158-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

This is exactly what i made the first time :(
Anyway, now dd_rescue runs and I give it a try=20

-----Urspr=FCngliche Nachricht-----
Von: Andreas Dilger [mailto:adilger@clusterfs.com]
Gesendet: Dienstag, 5. August 2003 19:47
An: Vitaly Fertman
Cc: Thorsten Mauch; 'reiserfs-list@namesys.com'
Betreff: Re: rebuildfs


On Aug 05, 2003  19:51 +0400, Vitaly Fertman wrote:
> On Tuesday 05 August 2003 19:30, Thorsten Mauch wrote:
> > Now i finised with the version 2.6.11.
> > I find now files that have exectly the creation time of thoose =
files i
> > seek. And at least
> > in one case the size is aslo resonalble. But the content is not =
like
> > expectet.
> > Is there a way to controll how the files are rebuild ? or is there
> > something that i
> > could do better ?
>=20
> If dd without conv=3Dnoerror fails for you -- you have problems with=20
> reading some blocks -- you should use dd_rescue instead as dd=20
> forgets to create holes in the target image when cannot read some=20
> block. This explains garbage in files in your case.

This same effect is available with normal dd via "conv=3Dsync,noerror".

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
