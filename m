From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Thu, 30 Jun 2005 11:57:27 -0400
Message-ID: <87psu3vnvc.fsf@evinrude.uhoreg.ca>
References: <hubert@uhoreg.ca>
	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>
	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>
	<8783be6605062914341bcff7cb@mail.gmail.com>
	<42C3615A.9020600@namesys.com> <871x6kv4zd.fsf@evinrude.uhoreg.ca>
	<20050630062956.GP16867@khan.acc.umu.se>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050630062956.GP16867@khan.acc.umu.se> (David Weinehall's
 message of "Thu, 30 Jun 2005 08:29:56 +0200")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Thu, 30 Jun 2005 08:29:56 +0200, David Weinehall <tao@acc.umu.se> said:

> On Thu, Jun 30, 2005 at 12:33:10AM -0400, Hubert Chan wrote:
>> It's sort of like the way web servers handle index.html, for those
>> who think it's a stupid idea.  (Of course, some people may still
>> think it's a stupid idea... ;-) )

> And guess what?  That's handled on the web server level (userland),
> not by the file system.  So different web servers can handle it
> differently (think index.html.sv, index.html.zh, index.php, etc).

From the web *browser*'s point of view, it is handled by the
"filesystem" (which is provided by the various servers).  The browser
doesn't care how or where the data is stored.  It just requests a file,
and gets some data back.  So the browser doesn't have to check for
http://www.example.com/, get a failure (trying to read a directory),
check for http://www.example.com/index.html, etc.  In this way, the web
server controls (which I think takes the place of the filesystem in this
case) what gets shown (index.html.sv, etc.), instead of the leaving it
up to the browser.

In the same way, you don't want every single user program to have to
guess whether it should look at .data, or .contents, or whatever.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

