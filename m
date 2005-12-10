From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Two usage examples for attribute directories.
Date: Fri, 09 Dec 2005 22:11:16 -0500
Message-ID: <87y82tbq97.fsf@evinrude.uhoreg.ca>
References: <200511201317.12598.pvh@uvic.ca> <200512021649.54939.pvh@uvic.ca>
	<43917967.4080008@st-andrews.ac.uk> <200512042027.16525.pvh@uvic.ca>
	<43983F5E.3080704@st-andrews.ac.uk>
	<87hd9jqq4d.fsf@evinrude.uhoreg.ca>
	<5c49b0ed0512091711y8b13c46lcbe627e28c708f95@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5c49b0ed0512091711y8b13c46lcbe627e28c708f95@mail.gmail.com>
	(Nate Diller's message of "Fri, 9 Dec 2005 17:11:55 -0800")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Fri, 9 Dec 2005 17:11:55 -0800, Nate Diller <nate.diller@gmail.com> said:

> This problem is already solved.

[...]

> so...

> $ls -aa /home/nate
> .
> ..
> ..icon.png
> .bash_rc
> icon.png

Dotfiles are horrible, IMHO, but that's just me.  I would prefer
foo/@/icon.png over foo/..icon.png.  But yes, that does solve the
collision problem.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

