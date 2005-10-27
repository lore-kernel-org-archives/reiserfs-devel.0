From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: Our introduction to Reiser-list
Date: Thu, 27 Oct 2005 12:20:05 -0700
Message-ID: <200510271220.06346.pvh@uvic.ca>
References: <200510251558.13860.pvh@uvic.ca> <200510262349.02012.pvh@uvic.ca>
 <4360B73D.5090502@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26691-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <4360B73D.5090502@slaphack.com>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On October 27, 2005 04:17 am, David Masover wrote:
> Peter van Hardenberg wrote:
> > On October 26, 2005 10:02 am, John Gilmore wrote:
> >
> > And I thought the whole idea was to unify the namespace and make things
> > like ID3 tags obsolete...
>
> The two are not mutually exclusive.  You unify the namespace, and use
> that to access things like ID3 tags.  Of course, eventually ID3 tags
> become obsolete, and the information is instead stored outside of the
> file itself, as a separate stream (treated as a file).  You'd have a
> standard way of serializing any given file and all its metadata, so that
> "something like id3" doesn't have to be re-invented for every file type
> that has metadata, and so that similar metadata can be accessed through
> a standard mechanism -- searching for a particular artist should return
> songs (using id3 tags) and music videos (using the mpeg equivalent) and
> maybe even song lyrics (using separate metadata).

It's much easier, more extensible, and more secure to create a utility which 
ties together a number of userspace metadata libraries to create static files 
than to move them all down into kernel space. I feel plugins providing 
pseudofiles should only be used when there is no viable alternative.

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
