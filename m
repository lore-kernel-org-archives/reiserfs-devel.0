From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Thu, 30 Jun 2005 00:33:10 -0400
Message-ID: <871x6kv4zd.fsf@evinrude.uhoreg.ca>
References: <hubert@uhoreg.ca>
	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>
	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>
	<8783be6605062914341bcff7cb@mail.gmail.com>
	<42C3615A.9020600@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C3615A.9020600@namesys.com> (Hans Reiser's message of "Wed,
 29 Jun 2005 20:04:58 -0700")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Wed, 29 Jun 2005 20:04:58 -0700, Hans Reiser <reiser@namesys.com> said:

> Ross Biro wrote:
>> How is directories as files logically any different than putting all
>> data into .data files and making all files directories (yes you would
>> need some sort of special handling for files that were really called
>> .data).

> Add to this that you make .data the default if the file within the
> directory is not specified,

It's sort of like the way web servers handle index.html, for those who
think it's a stupid idea.  (Of course, some people may still think it's
a stupid idea... ;-) )

> and define a stanadard set of names for metafiles, and you've got the
> essential idea, and any differences are details.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

