From: Chris Mason <mason@suse.com>
Subject: Re: Quota patches and  kinoded versions
Date: 30 Oct 2002 07:44:33 -0500
Message-ID: <1035981874.8455.9.camel@tiny>
References: <20021029201853.73380d45.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11838-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021029201853.73380d45.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs <reiserfs-list@namesys.com>

On Tue, 2002-10-29 at 14:18, Philippe Gramoull=E9 wrote:
> Hi Chris,
>=20
> I need to rebuild an up-to-date 2.4 quota aware kernel for Reiserfs 3.6 a=
nd
> i see this difference between what i run now ( 2.4.19-pre6) and the files=
 on your FTP servers:
>=20
> Since march 2002 ( timestamps of my files) , it was kinoded-8-2.4.19-pre3=
 and i see that
> kinoded-8-2.4.19-pre7 is of Sept 2002. Other files didn't change.
>=20
> We have some regular oopses on servers which act as fileservers ( ReiserF=
S+NFS) and i wonder
> whether i should upgrade regarding this.

The kinoded-8 patch was updated to 2.4.19-pre7, but not changes were
made other than a simple merge.

>=20
> Also, do you plan to sync quota patches with 2.4.20pre or with 2.4.20 fin=
al once its out ?

These won't fix the oops you posted yesterday.  I've got a patch in
testing here, I was hoping to reproduce the bug before sending it out
(instead of just guessing ;-)  I'll cleanup the debugging statements and
get you something worth using.

-chris


