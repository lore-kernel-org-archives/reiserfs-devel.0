From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 09:36:26 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408260935130.26316-100000@chimarrao.boston.redhat.com>
References: <20040826024956.08b66b46.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20669-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826024956.08b66b46.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: Spam <spam@tnonline.net>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 26 Aug 2004, Andrew Morton wrote:

> All of which can be handled in userspace library code.
> 
> What compelling reason is there for doing this in the kernel?

There's a compelling reason to do it in userspace.  If an
unaware program copies or moves such a file with streams
inside, it doesn't break the streams and aware programs will
continue to see them.

OTOH, if we had the streams in the kernel, unaware applications
would continuously break the metadata and streams that the
streams aware programs expect !

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

