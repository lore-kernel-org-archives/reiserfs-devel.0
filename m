From: Claudio Martins <ctpm@rnl.ist.utl.pt>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Mon, 29 Mar 2004 10:17:51 +0100
Message-ID: <200403291017.51872.ctpm@rnl.ist.utl.pt>
References: <200403271537.52955.sikkh@wp.pl> <40670001.60302@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17555-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40670001.60302@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Hans Reiser <reiser@namesys.com>, Piotr Neuman <sikkh@wp.pl>


On Sunday 28 March 2004 17:40, Hans Reiser wrote:
> Piotr Neuman wrote:
> >The new naming scheme for plugins ("metas" in snapshot 2004.03.26) may on
> >certain occasions cause name clashes. This patch changes "metas" into
> >"..metas" which should avoid this problem in most cases.
>
> The name clashing is less important than the greater user friendliness.
> Users on the mailing list convinced me of this.

  Please note that the supposed "user friendliness" you gain will go away the 
moment a user tries to unpack a source tarball for some project which happens 
to contain a directory named "metas". How are you going to fix it? You'll 
have the trouble of not getting the content of the "metas" directory which 
was inside the tarball and which tar failed to write to the directory, and 
you won't be able to build your project unless you modify it. This is just 
one example of many...

  So IMO it is much better to have a "..metas" and prevent all the trouble you 
*will* get for sure if using "metas".

  After all, unix filesystems have always been nice because they don't impose 
much restrictions on user filenames. As Filipe Almeida pointed out, why now 
reproduce the mess that exists in Windows with "aux" and such other special 
filenames?

Claudio

