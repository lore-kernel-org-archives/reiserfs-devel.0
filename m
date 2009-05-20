From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?= <fweisbec@gmail.com>
Subject: kill-the-bkl/reiserfs: request for linux-next inclusion
Date: Thu, 21 May 2009 01:40:57 +0200
Message-ID: <c62985530905201640j4a550b5bi7673e5a9f21029ce@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=8JfqYTPB5NUla6PQ0XfiexYdTxrt6S2QbOXHSJQ/egY=;
        b=EoDmS1veUZ99cYxtV0yVh0+Zv38+Szufn5EHSPVZJgkOLTgwjr0vy84WBecXzgeryZ
         FtDu4Ze9x8T8Kyuazx1KB2oWbIikuGRXz0kS2U2Ey4a9Ft9MR9QraaRCeQ30uy+WIPQB
         308lHsq+5r8ZlVAAuy1VjGi6QVhWsUmN9ODW0=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Reiserfs <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>

2009/5/16 Frederic Weisbecker <fweisbec@gmail.com>:
> Hi Al, Stephen,
>
> This patchset is subsequent to a rebase of the bkl killing in reiserf=
s
> work rebased against -rc6. It contains only fixes.
> The old topic is left unchanged but the new one reiserfs/kill-bkl-rc6=
 can
> be pulled against -rc6 without problem.
>
> Also, Al, I don't know if you would still accept to apply this work i=
n the VFS
> tree.
> The fact is that it becomes late in the process, we are already in -r=
c6
> and I would like it to be tested at least in linux-next.
>
> So, it's up to you. Whether you prefer to apply it and make it
> available to next, or I can ask Stephen to pull directly from my tree=
=2E
>
> Thanks,
> Frederic.
>
> The following changes since commit b693ba70c541a5a26eb4e8f2db5ade454a=
fe1c74:
> =A0Frederic Weisbecker (1):
> =A0 =A0 =A0 =A0kill-the-bkl/reiserfs: unlock only when needed in sear=
ch_by_key
>
> are available in the git repository at:
>
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-trac=
ing.git
> =A0 =A0 =A0 =A0reiserfs/kill-bkl-rc6


Stephen,

I guess Al is traveling or something.

Until it finds its way to the VFS tree, it would be nice if this
reiserfs bkl removal tree could be included in linux-next
for testing.
Could you please include it ?

You can pull from:

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.g=
it
reiserfs/kill-bkl-rc6

Thanks!


> Frederic Weisbecker (2):
> =A0 =A0 =A0kill-the-bkl/reiserfs: acquire the inode mutex safely
> =A0 =A0 =A0kill-the-bkl/reiserfs: move the concurrent tree accesses c=
hecks per superblock
>
> =A0fs/reiserfs/do_balan.c =A0 =A0 =A0 =A0 | =A0 17 +++++------------
> =A0fs/reiserfs/fix_node.c =A0 =A0 =A0 =A0 | =A0 =A05 +----
> =A0fs/reiserfs/journal.c =A0 =A0 =A0 =A0 =A0| =A0 34 ----------------=
------------------
> =A0fs/reiserfs/prints.c =A0 =A0 =A0 =A0 =A0 | =A0 =A04 ----
> =A0fs/reiserfs/stree.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A05 +----
> =A0fs/reiserfs/xattr.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++--
> =A0include/linux/reiserfs_fs.h =A0 =A0| =A0 35 ++++++++++++++++++++++=
+++++++++++++
> =A0include/linux/reiserfs_fs_sb.h | =A0 11 +++++++++++
> =A08 files changed, 55 insertions(+), 60 deletions(-)
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
