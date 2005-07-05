From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Tue, 05 Jul 2005 16:46:27 -0400
Message-ID: <87wto5yo9o.fsf@evinrude.uhoreg.ca>
References: <20050630153738.GU11013@nysv.org>
	<200506301952.j5UJqPrn013513@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506301952.j5UJqPrn013513@laptop11.inf.utfsm.cl> (Horst von
 Brand's message of "Thu, 30 Jun 2005 15:52:25 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Nikita Danilov <nikita@clusterfs.com>, Douglas McNaught <doug@mcnaught.org>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Thu, 30 Jun 2005 15:52:25 -0400, Horst von Brand <vonbrand@inf.utfsm.cl> said:

>> This doesn't even invalidate the userland VFSs of the other guys,
>> they're still needed for systems whose kernels don't have a metadata
>> facility.

> So the metadata facility in kernel won't be used, for portability's
> sake.

Oh gee.  Every operating system does threads differently.  Mozilla has
an abstraction layer called nspr that allows them to handle threads
portably.  glib/gtk has their own threads abstraction.  On Windows, nspr
will use the Windows method for handling threads.  On Linux, it will use
the Linux way.  On systems that don't support threads, it can usually
emulate it using timers.

It's the exact same thing with the userspace VFS.  If GNOME needs to
handle extended attributes, it can use one mechanism under one operating
system, or emulate it using some ugly hack on operating systems that
don't support extended attributes.

Isn't that the whole point of having a VFS?

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

