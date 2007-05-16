From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Why reiser does a disk write on every sync() call?
Date: Wed, 16 May 2007 19:32:33 +0400
Message-ID: <200705161932.34390.vs@namesys.com>
References: <08A9A3213527A6428774900A80DBD8D803BB80B4@xmb-sjc-222.amer.cisco.com> <200703272254.46500.vs@namesys.com> <2f4958ff0705120603x4da5bcdq2c48c9394586f6c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-30650-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff0705120603x4da5bcdq2c48c9394586f6c@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Grzegorz =?utf-8?q?Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Hello

On Saturday 12 May 2007 17:03, Grzegorz Ja=C5=9Bkiewicz wrote:
> sounds like useless waste of time and space
> You haven't stated the reason, why it has to create and commit empty
> transaction.
>=20

I think we should fix that.

Chris, do you think that we could avoid creating fake transactions with the=
 below patch?


diff -puN fs/reiserfs/super.c~reiserfs-avoid-syncing-clean-fs fs/reiserfs/s=
uper.c
=2D-- linux-2.6.21-mm2/fs/reiserfs/super.c~reiserfs-avoid-syncing-clean-fs	=
2007-05-16 18:18:45.000000000 +0300
+++ linux-2.6.21-mm2-vs/fs/reiserfs/super.c	2007-05-16 18:19:06.000000000 +=
0300
@@ -62,7 +62,7 @@ static int reiserfs_statfs(struct dentry
=20
 static int reiserfs_sync_fs(struct super_block *s, int wait)
 {
=2D	if (!(s->s_flags & MS_RDONLY)) {
+	if (!(s->s_flags & MS_RDONLY) && s->s_dirt) {
 		struct reiserfs_transaction_handle th;
 		reiserfs_write_lock(s);
 		if (!journal_begin(&th, s, 1))

_
