From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:59:36 +0100
Message-ID: <20040826135936.GC5733@mail.shareable.org>
References: <20040826024956.08b66b46.akpm@osdl.org> <Pine.LNX.4.44.0408260935130.26316-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0408260935130.26316-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Rik van Riel wrote:
> > All of which can be handled in userspace library code.
> > 
> > What compelling reason is there for doing this in the kernel?
> 
> There's a compelling reason to do it in userspace.  If an
> unaware program copies or moves such a file with streams
> inside, it doesn't break the streams and aware programs will
> continue to see them.
> 
> OTOH, if we had the streams in the kernel, unaware applications
> would continuously break the metadata and streams that the
> streams aware programs expect !

You appear not to have read any of my mails on this topic.

Properly implemented metadata can:

  (1) operate in both modes simultaneously;
  (2) work with unaware applications;
  (3) provide performance enhancements to aware applications;
  (4) provide storage enhancements to both;
  (5) provide useful features that work with standard unmodified unix tools,

all at once.  That includes program copies.

-- Jamie
