From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: serious Reiser4 fsck problem
Date: Sat, 22 Jul 2006 12:10:48 +0200
Message-ID: <op.tc248azkd4os1z@localhost>
References: <44C1F93A.9090109@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29132-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C1F93A.9090109@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Sat, 22 Jul 2006 12:08:58 +0200, Dirk <noisyb@gmx.net> napisa=B3:

> Hello,
> will using
>
> fsck.reiser4 --build-fs
>
> result in data loss? I mean to fix the partition - NOT to lose the data
> on it..
>
> The manual page is also not very specific about if data will be lost or
> not when using this option...
>
> Using --fix resulted in a message that I should use --build-fs to remove
> corruption...

You will probably end up with some amount of files in lost&found dir, =20
those will be the files that fsck can't recognize from what dir are coming =
=20
and what are named, depending on what corruption You have there can always =
=20
be some files that You won't get back. As always, backups are a must have  =

on any fs.

