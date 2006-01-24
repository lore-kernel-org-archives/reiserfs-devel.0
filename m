From: Roman I Khimov <rik@osrc.info>
Subject: Reiser4 corruption (fsck.reiser4 broken?)
Date: Tue, 24 Jan 2006 22:57:40 +0300
Message-ID: <200601242257.43836.rik@osrc.info>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5581993.d3sKjWWZBk";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart5581993.d3sKjWWZBk
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Well, quite an interesting feeling when you lost 80G of music and 100G of=20
other great stuff... Refreshing, I should say.

OK, let me explain in detail what's happening here. I have a 250Gb HDD in=20
external IEEE1394 aka Firewire enclosure. It's encrypted via dm-crypt (no=20
partitions, from block #0 to the end) and, you can guess it, I've placed a=
=20
Reiser4 partition on it.

I'm using -mm tree kernels and right now I have two of them for my system -=
=20
2.6.15-rc5-mm3 and 2.6.15-mm4. The first one worked just fine for me, but=20
with second I've been experiencing some strange "Badness" from kernel block=
=20
level, which at that moment I had no time to save/report/analyse. That was=
=20
several times when using that external HDD. I have no logs for it, sorry=20
(I'm a bad user, I know...)

So, despite of that "Badness" everything worked fine, I was using one or=20
another kernel depending on my mood. Until today, when I thought "man, are=
=20
you sure that everything is OK? Maybe it's time to make fsck on that drive,=
=20
you know, there is something you don't want to lose there..."

So, I've ran fsck.reiser4 on dm-mapped drive (with kernel 2.6.15-rc5-mm3)=20
and it said that there is 1 inconsistency found. Not that bad for kernel=20
"Badness", it recommended to run itself with "--build-fs" parameter, I did=
=20
so and... Lots of output on the screen, some ~38000 files found and ~36000=
=20
files lost&found. Mounting my drive, what's here?

rik@pu-erh:/media/ext-250/lost+found> ls | wc -l
34799

And, of course, lots of files just disappeared. I see some of them in=20
"lost+found" directory, but some of them are corrupted - I've tried to play=
=20
one with "suspicious" size and mplayer just quit seconds later with lots of=
=20
"[mpeg4 @ 0x84b4e88]marker does not match f_code" errors. That one was just=
=20
fine week or so ago.

As I've said, I'm a bad user with no logs for any of that actions (didn't=20
expected that one inconsistency can be source of such badness). I'm not=20
asking for help with data restoring (although I would try anything to do=20
that), it's all my fault, but the question is - how can I help debugging=20
the situation (if there is something to debug at all), what info may I=20
provide (I'm very useful without logs, I know...)?

Seems to me fsck.reiser4 is not that good at restoring file systems, becaus=
e=20
in those fragments in "lost+found" I clearly see parts of files that were=20
just fine yesterday.

Reiser4progs version 1.0.4.

[ searching a bit... ]

Cool, newest version is 1.0.5. My fault... again. So, just tell me that it'=
s=20
fixed in this version - I'll laugh at myself a little... ;-)

=2D-=20
                            Roman
 ,---------------------------. ,--------------------------.
/     http://www.3os.ru/      V    http://www.osrc.info/   \         .o.
\    mailto: rik@3os.ru       ^   mailto: rik@osrc.info    /         ..o
 `---------------------------' `--------------------------'          ooo
gpg --recv-keys 0xE5E055C3 --keyserver hkp://subkeys.pgp.net

--nextPart5581993.d3sKjWWZBk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBD1oa3XJ70z+XgVcMRAi2VAJ9YRy5kkNDnXKnrk+E1IyGX93vMOgCg3BXA
aMCFNXSk77ynykA05xD8+d8=
=6Rez
-----END PGP SIGNATURE-----

--nextPart5581993.d3sKjWWZBk--
