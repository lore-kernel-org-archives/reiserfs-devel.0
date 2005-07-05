From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Tue, 05 Jul 2005 17:01:17 -0400
Message-ID: <87ll4lynky.fsf@evinrude.uhoreg.ca>
References: <hubert@uhoreg.ca>
	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>
	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>
	<8783be6605062914341bcff7cb@mail.gmail.com>
	<878y0svj1h.fsf@evinrude.uhoreg.ca> <42C4F97B.1080803@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C4F97B.1080803@slaphack.com> (David Masover's message of
 "Fri, 01 Jul 2005 03:06:19 -0500")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Ross Biro <ross.biro@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Fri, 01 Jul 2005 03:06:19 -0500, David Masover <ninja@slaphack.com> said:

> Hubert Chan wrote:

>> The main thing blocking file-as-dir is that there are some
>> locking(IIRC?) issues.  And, of course, some people wouldn't want it
>> to be merged into the mainline kernel.  (Of course, the latter
>> doesn't prevent Namesys from maintaining their own patches for people
>> to play around with.)

> What's the locking issue?  I think that was more about transactions...

It was whatever was Al Viro's (technical) complaint about file-as-dir.
I don't remember exactly what it was.  The technical people know what it
is (and the Namesys guys are probably working on it), and the exact
issue doesn't concern us non-technical people that much, so I don't feel
like looking it up.  But if you want to, just look for Al Viro's message
in this thread.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

