From: David Masover <ninja@slaphack.com>
Subject: Re: Our introduction to Reiser-list
Date: Thu, 27 Oct 2005 06:17:17 -0500
Message-ID: <4360B73D.5090502@slaphack.com>
References: <200510251558.13860.pvh@uvic.ca> <5c49b0ed0510261540l370acbfepfe4b6649c91cee61@mail.gmail.com> <200510261702.06844.jgilmore@glycou.com> <200510262349.02012.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26683-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510262349.02012.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

Peter van Hardenberg wrote:
> On October 26, 2005 10:02 am, John Gilmore wrote:
> 
>>Actually, when I had first read about file-as-directory, I had assumed that
>>the content was either dynamically generated from the on-disk metadata
>>(like uid, gid, etc) or stored as a "sideband" type stream in the file
>>itself, like some of the MAC OS file systems (and others) do, or generated
>>via a plugin connecting to user-space, for ID3 tags on mp3 files and other
>>information which can easily be obtained from the file itself.
> 
> 
> And I thought the whole idea was to unify the namespace and make things like 
> ID3 tags obsolete...

The two are not mutually exclusive.  You unify the namespace, and use
that to access things like ID3 tags.  Of course, eventually ID3 tags
become obsolete, and the information is instead stored outside of the
file itself, as a separate stream (treated as a file).  You'd have a
standard way of serializing any given file and all its metadata, so that
"something like id3" doesn't have to be re-invented for every file type
that has metadata, and so that similar metadata can be accessed through
a standard mechanism -- searching for a particular artist should return
songs (using id3 tags) and music videos (using the mpeg equivalent) and
maybe even song lyrics (using separate metadata).
