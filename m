From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 01:40:29 -0700
Message-ID: <412DA1FD.4010507@namesys.com>
References: <Pine.LNX.4.44.0408252052420.13240-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408252052420.13240-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rik van Riel <riel@redhat.com>
Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Rik van Riel wrote:

>
>
>If your backup program dives into the file despite stat()
>saying it's a file and you restore your backup, how are the
>"file is a file" semantics preserved ?
>
>Obviously this is something that needs to be sorted out at
>the VFS layer.
>
It needs to be sorted out, whether it is sorted out at the VFS layer is 
unimportant.

>  A filesystem specific backup and restore
>program isn't desirable, if only because then there'd be
>no way for Hans's users to switch to reiser5 in 2010 ;)
>
>  
>
It might be that we need a filenameA/metas/backup method for all of our 
file plugins, which if cat'd gives a set of instructions which if 
executed are adequate for restoring filenameA.

Hans
