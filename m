From: Philipp =?utf-8?q?G=C3=BChring?= <p.guehring@futureware.at>
Subject: Re: A couple of questions
Date: Fri, 17 May 2002 02:45:19 +0200
Message-ID: <200205170048.g4H0mI402129@linux1.futureware.at>
References: <OF4AF5C20B.BE2F7D18-ON85256BBB.006643F3@pok.ibm.com> <20020516214419.GE15774@schmorp.de> <3CE4476E.8070101@namesys.com>
Reply-To: p.guehring@futureware.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10352-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CE4476E.8070101@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear Hans,

> I am a filesystems developer, and I don't know enough to do more than
> press y with most fscks. =20

There is one case, in which I know that I have to say no: If the partition =

that a fsck tries to correct has a different type than the fsck thinks.=20
(Running e2fsck against a reiserfs partition for example)

And those things happens when someone changes harddisks, ...

> I think that for the most part, if one is
> going to ask the user to help, one needs to provide a real interface, a
> filesystem structure editor..... =20

Well, debugfs (ext2) was an approach into that direction, isn't it?
Now I stumbled across debugreiserfs, but it lacks interactive mode.

> which no FS has ever done....  but
> right now we need to get what we have debugged thoroughly.  It is on the
> list of things I would like to add someday.

What I would like to see is a tool to do the following:
(And I don't think that I will find a sponsor for that tool :-(

After a crash, I make a dd from the crashed partition, into a normal file i=
n=20
another partition, that's perhaps on a differnt harddisk.

Then I want to run a dumping utility, that tries to restore every bit that =

still can be found in the crashed partition, and tries to resemble all the =

files in it, and even creating a lost&found directory ...

That dumping utility should take an output directory as argument, in which =
it=20
recreates the contents.

Something like "The Coroners Kit", but more for recovery than for=20
investigation.

What is important for that tool:
* It must not crash under any circumstances. Even if every bit of the=20
filesystem is currupted, it has to do its work, and try to recover as much =
as=20
possible.
* It has to assume that every bit of the filesystem can be corrupt, so it h=
as=20
to try to semantically verify the bits, pointers, ...
* It should try different ways to restore access to lost data, if it stumbl=
es=20
across problems in the filesystems.
* There must not be any assertions that would not allow the tool to run ove=
r=20
the whole partiton, and search everywhere for lost data
* It has to be designed to work on files which are dumps from partition bas=
ed=20
filesystems.
* It should be able to detect and correct common hardware or crash related =

problems in the filesystem:=20
  * Files that are not statable or accessible, because there only exists an=
=20
entry in the directory, but nothing in the reiserfs tree
  * Transactions that are open
  * Corrupted directory entries like filenames with special charakters that=
=20
can not be used from the system, or rights with undefined bits, ...
  * ...
* It must not change any data on the partition, instead it writes everythin=
g=20
to an output directory

Many greetings,
- --=20
~ Philipp G=C3=BChring              p.guehring@futureware.at
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE85FKjlqQ+F+0wB3oRAlT3AJ9/2t5pDirnnLs/4daKrSKWD2msxQCeIHZx
BU+PvfxKKbojRtdnLPerfMY=3D
=3DdohB
-----END PGP SIGNATURE-----
