From: Dieter =?iso-8859-15?q?N=FCtzel?= <d.nuetzel@wearabrain.de>
Subject: Re: Will Reisefs have "undo"?
Date: Sun, 15 Jun 2003 14:09:41 +0200
Message-ID: <200306151409.41970.d.nuetzel@wearabrain.de>
References: <1055615895.698.129.camel@localhost> <000d01c332ac$a94e23a0$0200a8c0@xpstation> <1055670615.671.106.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14550-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1055670615.671.106.camel@localhost>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Joachim Zobel <nc-zobeljo@netcologne.de>, ReiserFS ML <reiserfs-list@namesys.com>

Am Sonntag, 15. Juni 2003 11:50 schrieb Joachim Zobel:
> Am Sam, 2003-06-14 um 21.39 schrieb Fred -- Speed Up --:
> > This is not the filesystem's work, KDE for instance has a trashcan, and
> > you can bind the rm command to a special mv one that moves files from t=
he
> > initial place to a backup folder, the files of which you can empty
> > regulary with a cron script depending on the file's "age". It's simple =
to
> > implement, and really not something Reiser4 should be capable of ...
> > instead journalising works very well to protect data from being erased,
> > that's the only purpose of a modern filesystem.
>
> A filesystem undo is most needed on servers.

No.

> There usually is no KDE.

True.

> However a trash can can be done with hard links and a cronjob.

True.

> What I would like to have is more - I think I was not clear enough about
> that. I not only want to undo deletions. I would like to be able to undo =
all
> file system operations.

What you are looking for are FS snapshots.
LVM or EVMS can do that with all (?) Linux FSs.

> VMS has a versioning file system, which does about what I want.

Windows 2003 Server (very new feature ;-), too.=20
But it is a bloated thing.

> It feels pretty good if you can undo "everything I did since 11:30".

You should have some TRUE backups (snapshots) handy.

=2D-=20
Dieter N=FCtzel
Leiter F&E, WEAR-A-BRAIN GmbH, Wiener Str. 5, 28359 Bremen, Germany
Mobil: 0162 673 09 09

