From: "=?iso-8859-1?Q?arthur.chereau?=" <arthur.chereau@voila.fr>
Subject: =?iso-8859-1?Q?Reiserfs/emacs_incompatibility/bug_=3F?=
Date: Sat, 28 Sep 2002 11:28:52 +0200
Message-ID: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11555-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?utf-8?Q?reiserfs-list?= <reiserfs-list@namesys.com>

Hi,

I've noted a strange behavior of emacs when used with the Reiserfs filesystem.
This doesn't seem to happen with the other filesystems, so it may be related to Reiserfs.

If you use emacs, here are how to reproduce this:

The "backup-by-copying" option tells emacs to make a backup file by copying the
original file, thus preserving the original file's metadata. Let's have the following
.emacs:
$ cat .emacs
(setq backup-by-copying t)
$

The correct bahavior is:
$ emacs test
$ ls -i test*
2971971 test
$ emacs test
$ ls -i test*
2971971 test 2971972 test~
$ emacs test
$ ls -i test*
2971971 test 2971973 test~

This is what is observed on an ext2 fs, for instance.

Now let's do the same on a reiserfs filesystem:
$ emacs test
$ ls -i test*
1505188 test
$ emacs test
$ ls -i test*
1505190 test 1505189 test~
$ emacs test
$ ls -i test*
1505191 test 1505189 test~

Here the backup file metadata are preserved, instead of the original file ones.

When not setting the backup-by-copying option, the file metadata are sometimes reset to
644, which can be annoying for scripts.
I couldn't find a way to reproduce that behavior at 100%.

This happens with the latest emacs from cvs on a reiseirfs 3 filesystem.
This never happens with an emacs-like tool like jed.

RMS doesn't think it's a bug in emacs as it works on other filesystems.

So maybe emacs handles moves/renames in way that:
- reveals a bug in reiserfs
- doesn't work well with reiserfs and emacs developpers are not aware of that

------------------------------------------

Faites un voeu et puis Voila ! www.voila.fr 

