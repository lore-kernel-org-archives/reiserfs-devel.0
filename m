From: "David Dabbs" <david@dabbs.net>
Subject: RE: [RFC] Pathname Semantics with //
Date: Thu, 9 Sep 2004 15:17:42 -0500
Message-ID: <20040909201301.1165215D64@mail03.powweb.com>
References: <200409091933.06100.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21649-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409091933.06100.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Christian Mayrhuber' <christian.mayrhuber@gmx.net>
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com


> Christian Mayrhuber
> 
> What about using // as some URI entry point?
> An URI looks like:
> PROTOCOL://PROTOCOL_SPECIFIC_NAMESPACE_IMPLEMENTATION
> 
I considered that in that //: is implicitly file://, but didn't make it
explicit in the proposal. Perhaps //: could be a legal alias for //file://.


> ...
>
> If someone wants to expose filesystem metadata
> something like //metas:// instead of //: could do it.
> 
>       //metas://a-directory/SomeName      regular dir entry
>       //metas://a-directory//SomeName     named stream
>       //metas://a-directory///SomeName    == //metas://a-
> directory/SomeName
> 

But this means that metas:// becomes an alias for file:// depending upon
what you want to access. If we want to explicitly require a URI for files,
which may be the way to go, then there should be one protocol for file
access, file://. The semantics for that would be such that // on the end of
a file or directory means "access the named stream if the a) VFS supports
this and b) the device where the named object resides supports named
streams."  Programs that want to access named streams would use 

  //file://a-directory//SomeName

to access the streams as well as normal objects. Apps that exclusively use
the URI-style path would need to be more precise that is required today.
Today it works to concatenate "/home/" and "/"myfile" and references the
correct file. Under URI semantics, this would fail or not behave as
expected. 

David



