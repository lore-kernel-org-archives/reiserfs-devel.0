From: "=?iso-8859-1?Q?arthur.chereau?=" <arthur.chereau@voila.fr>
Subject: =?iso-8859-1?Q?Re:__Reiserfs/emacs_incompatibility/bug_=3F?=
Date: Mon, 30 Sep 2002 08:34:20 +0200
Message-ID: <H38NL8$7E21F734BCE1FC3CA596D1CF9DE21BC4@voila.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11561-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?utf-8?Q?reiserfs-list?= <reiserfs-list@namesys.com>

>Did you look at the file contents? (Modify the file and look at the SHA1
> or MD5 digests.)

Yes, I edit the file. To be more precise here's what's observed:

With the following  .emacs:
$ cat .emacs
(setq backup-by-copying t)
$

On ext2 (correct behavior):

$ emacs test
$ cat test
version 1
$ ls -i test*
2971971 test
$ emacs test
$ cat test
version 2
$ ls -i test*
2971971 test 2971972 test~
$ emacs test
$ cat test
version 3
$ ls -i test*
2971971 test 2971973 test~

On Reiserfs (problem):
$ emacs test
$ cat test
version 1
$ ls -i test*
1505188 test
$ emacs test
$ cat test
version 2
$ ls -i test*
1505190 test 1505189 test~
$ emacs test
$ cat test
version 3
$ ls -i test*
1505191 test 1505189 test~

The fact that it doesn't happen on ext2 makes me think it's related to Reiserfs.

------------------------------------------

Faites un voeu et puis Voila ! www.voila.fr 

