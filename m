From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Fibration etc
Date: Fri, 16 Apr 2004 17:12:02 +0400
Message-ID: <16511.56226.412834.375701@laputa.namesys.com>
References: <20040415200243.GX14134@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17991-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040415200243.GX14134@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Markus =?koi8-r?B?VPZybnF2aXN0KQ==?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

Markus T=F6rnqvist writes:
 > Hi!
 >=20
 > I think this may be of some interest to other people too, so I won't just
 > take it up on IRC.
 >=20
 > What's up with this:
 > mjt@shrike:~/tmp$ echo -e 'lexicographic\0' > ..metas/plugin/fibration
 > mjt@shrike:~/tmp$ cat ..metas/plugin/fibration=20
 > 1 dot-o fibrate .o files separatelymjt@shrike:~/tmp$=20
 >=20
 > I actually noticed that it changes the behavior of empty directories.
 > Maybe the READ.ME should mention this?

Yes, it should.

 >=20
 > Is there any means of refibrating populated directories or do I have to
 > bounce everything by some tmp directory?

There is no kernel mechanism.

 >=20
 > This is then also correct, it just fails because directories are
 > populated with dot-o?

Correct.

 >=20
 > /dev/hda1       /               reiser4 defaults,plugin.fibration=3Dext-1
 > 0       0
 >=20
 > However, if I do an mkdir after having mounted like that, shouldn't
 > all new directories be ext-1 by default, not dot-o?

Err.... this mount option is a left-over from old times. Fibration of a
new directory is controlled by fibration of its parent.

 >=20
 > How does the fibration work with links? Does it fibrate names of files
 > or contents of files together? How about hardlinks? Does it follow
 > symlinks?

Fibration affects

   * names,

   * bodies of files "located in" the directory.

Names are always sorted according to the fibration.

File is "located" within directory where it was created. If file is
hard-linked from another directory D2, its new name will be stored
according to D2's fibration, but body would remain intact.

Content of symbolic link is treated exactly like every other file in
this respect, and target of symbolic link is.. not related.

 >=20
 > Is there some way of check that with some debug tool?

debugfs.reiser4 -t

 >=20
 > Thanks!
 >=20
 > --=20
 > mjt
 >=20

Nikita.
