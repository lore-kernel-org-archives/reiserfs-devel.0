From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Tue, 28 Jun 2005 21:51:08 -0400
Message-ID: <87wtoedj77.fsf@evinrude.uhoreg.ca>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl>
	<200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu>
	<42BDC422.6020401@namesys.com> <42BE3645.4070806@cisco.com>
	<e692861c05062522071fe380a5@mail.gmail.com>
	<42BE563D.4000402@cisco.com> <42BE5DB6.8040103@slaphack.com>
	<200506261816.j5QIGMdI010142@turing-police.cc.vt.edu>
	<42BF08CF.2020703@slaphack.com>
	<200506262105.j5QL5kdR018609@turing-police.cc.vt.edu>
	<42BF2DC4.8030901@slaphack.com>
	<200506270040.j5R0eUNA030632@turing-police.cc.vt.edu>
	<42BF667C.50606@slaphack.com>
	<5284F665-873C-45B7-8DDB-5F475F2CE399@mac.com>
	<42BF7167.80201@slaphack.com>
	<EC02A684-815A-4DF8-B5C1-9029FE45E187@mac.com>
	<42C06D59.2090200@slaphack.com>
	<CD59AE36-FD15-4A4C-9E1D-AB2F8B52D653@mac.com>
	<42C08B5E.2080000@slaphack.com> <87y88vrzkg.fsf@evinrude.uhoreg.ca>
	<42C1B19F.6010808@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24785-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C1B19F.6010808@slaphack.com> (David Masover's message of
 "Tue, 28 Jun 2005 15:22:55 -0500")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Tue, 28 Jun 2005 15:22:55 -0500, David Masover <ninja@slaphack.com> said:

> Come to think of it, that changes the proposal a bit.  You need a
> different way to access the meta-dir for files than for directories,
> if we're going to support /meta/vfs.  No biggie:

> /meta/vfs/file/home/bob/sue.mpg/acl
> /meta/vfs/dir/home/bob/acl

What if /home has an extended attribute named bob?  Then is
/meta/vfs/dir/home/bob a file or a directory?

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

