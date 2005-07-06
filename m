From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 08:18:59 -0500
Message-ID: <42CBDA43.6030305@slaphack.com>
References: <200507060255.j662tndQ005308@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200507060255.j662tndQ005308@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Hans Reiser <reiser@namesys.com>, Hubert Chan <hubert@uhoreg.ca>, Ross Biro <ross.biro@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Horst von Brand wrote:
> David Masover <ninja@slaphack.com> wrote:
> 
> [...]
> 
> 
>>Just don't allow user-created hardlinks inside either metafs (/meta) or
>>the magical meta directory inside files.
> 
> 
> And what is it useful for, after its advantage was that it was /exactly/
> like regular files &c, and now it is severely crippled?

The advantage was never that meta files look exactly like regular files, 
but that they look enough like regular files that you can use existing 
tools on them.  Of course, there are some times when you want meta files 
to look exactly like regular files, as in (I hate to bring it up again, 
but...) zip files.

So, a zip file (/meta/vfs/some/zip/file/.../contents/) would allow 
hardlinks between files inside the zipfile, but not outside of it.  This 
would be like creating a separate mountpoint for the zipfile's contents, 
and doing "mount --bind" when a hardlink to the zipfile is created.

I'm not sure if we actually have to pretend it's a mountpoint, or if we 
can just take the checking that mountpoints already do and generalize it.


Can you think of a way in which hardlinks are useful in /meta, in a 
*general* way, instead of within a specific directory controlled by a 
specific plugin?
