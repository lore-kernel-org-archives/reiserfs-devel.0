From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 10:58:02 -0400
Message-ID: <873br3u9s5.fsf@evinrude.uhoreg.ca>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl>
	<42BCD93B.7030608@slaphack.com>
	<200506251420.j5PEKce4006891@turing-police.cc.vt.edu>
	<42BDA377.6070303@slaphack.com>
	<200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu>
	<42BDC422.6020401@namesys.com> <42BE3645.4070806@cisco.com>
	<e692861c05062522071fe380a5@mail.gmail.com>
	<42BE563D.4000402@cisco.com> <42BE5DB6.8040103@slaphack.com>
	<200506261816.j5QIGMdI010142@turing-police.cc.vt.edu>
	<42BF08CF.2020703@slaphack.com>
	<200506262105.j5QL5kdR018609@turing-police.cc.vt.edu>
	<42BF2DC4.8030901@slaphack.com>
	<200506270040.j5R0eUNA030632@turing-police.cc.vt.edu>
	<87y88webpo.fsf@evinrude.uhoreg.ca>
	<200506270459.j5R4xdZp005659@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506270459.j5R4xdZp005659@turing-police.cc.vt.edu> (Valdis
 Kletnieks's message of "Mon, 27 Jun 2005 00:59:39 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Mon, 27 Jun 2005 00:59:39 -0400, Valdis.Kletnieks@vt.edu said:

> On Sun, 26 Jun 2005 23:10:43 EDT, Hubert Chan said:
>> On Sun, 26 Jun 2005 20:40:29 -0400, Valdis.Kletnieks@vt.edu said:

>> Oh, I'm waiting for the fun the first time somebody deploys a
>> plugin that has similar semantics to 'chmod g+s dirname/' ;)

> (You *did* notice it was set-GID of a *directory* not an executable
> file, right?)

>> Reiser4 plugins have to be compiled into the kernel.  (They're not
>> plugins in the sense that most people use that word.)  And any admin
>> who would compile that kind of plugin into the kernel needs to have
>> his head

> Oh?  You saying that it *wont* be permitted for a user to say:

[...]

Sorry.  I completely misunderstood what you were getting at.  I thought
that you were implying that with the right kind of plugin, users would
be able to get around security measures.  Of course, this is probably
true, which means that plugins need to be coded carefully (as with
everything else in the kernel).  My point that I was trying to make was
that users can't install arbitrary plugins, and the set of plugins
available is controlled by the administrator.

Since that wasn't what you were talking about, I retract my previous
email.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

