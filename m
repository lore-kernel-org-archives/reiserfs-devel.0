From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [RFC] Pathname Semantics with //
Date: Fri, 10 Sep 2004 00:03:33 +0100
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040909230333.GB8464@mail.shareable.org>
References: <20040909103656.B15E715CB2@mail03.powweb.com> <200409091933.06100.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200409091933.06100.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com, David Dabbs <david@dabbs.net>, linux-fsdevel@vger.kernel.org

Christian Mayrhuber wrote:
> //http://somehost:port/foo/bla

While we're here, I'll point out that http://somehost/foo/bla and
http://somehost/foo/bla/ are valid, distinct URLs.

If http://somehost/foo/bla/ exists, many HTTP servers will return it
as the target of a redirect for http://somehost/foo/bla.  The reason
for this is that it's important for any relative URLs in a document to
be resolved relative to the correct base URL of the document.

If we do actually allow file-and-directory objects, it makes sense for
the path _with_ slash on the end (//http://somehost/foo/bla/) to be
accessible as both a file and a directory, mapping to that HTTP
resource, and resources below it in the path hierarchy.

Then relative paths in the resource resolve sensibly in programs which
think they're in the local filesystem.

It also makes sense for the path _without_ slash to be recognisable to
programs as needing the slash.  That could be done by making the path
without slash by a symlink to one with (symlinks are a natural
representation of redirects).  But that seems like a gross violation
of POSIX semantics: we can't really return different objects depending
on the trailing slash.

So instead, it makes sense for either form of the path to be a
file-and-directory object whose type is S_IFDIR, and specifically not
S_IFREG -- but only in the cases where the HTTP transaction to the URL
without a trailing slash returns a redirect to the same URL with a
slash appended.  When the HTTP transaction to the URL without a
trailing slash returns a resource, then it's type in the filesystem
should be S_IFREG, but still a file-as-directory object.

Food for thought.

-- Jamie
