From: Mikael Cluseau <nwrk@nwrk.dyndns.org>
Subject: Re: I've done a very bad mistake
Date: Thu, 01 Jul 2004 17:36:40 +0200
Message-ID: <1088696200.11333.58.camel@localhost>
References: <200407011523.48481.aotto1968@onlinehome.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19480-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407011523.48481.aotto1968@onlinehome.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: aotto1968@t-online.de
Cc: reiserfs-list@namesys.com

Le jeu 01/07/2004 =C3=A0 15:23, Andreas Otto a =C3=A9crit :
> Hi,
>=20
>   I've done as root:=20
>    >> cp some_file /dev/hdb7

I remember that cp ask to *replace* a file, not to "put the source file
at the beginning of the target file". Did you really verified that your
partition was really modified ? I would be very surprised of this
attitude from cp...

In that case,

# rm /dev/hdb7 &&
# mknod /dev/hdb7 b 3 71

should work on a non-devfs system, and

# rm /dev/hdb7 &&
# ln -s ide/host0/bus0/target1/lun0/part7 /dev/hdb7

should work on a devfs system.

--
Mikael.
