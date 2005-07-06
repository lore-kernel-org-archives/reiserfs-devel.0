From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: reiser4 plugins
Date: Tue, 05 Jul 2005 20:50:08 -0400 EDT
Message-ID: <1740726161-BeMail@cr593174-a>
References: <42CB1E12.2090005@namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CB1E12.2090005@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: hubert@uhoreg.ca, ross.biro@gmail.com, vonbrand@inf.utfsm.cl, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, ninja@slaphack.com

Hans Reiser wrote on Tue, 05 Jul 2005 16:56:02 -0700:
> One can have hardlinks to a directory without cycles provided that one
> does not have hardlinks from the children of that directory to any file
> not a child of that directory.  (Mountpoints currently implement that
> restriction.)
> 
> Question: can one implement that lesser restriction above with elegant
> code?  Is the greater restriction below easier to code?  (If no to the
> first and yes to the second is correct, then I can accept the greater
> restriction described below.)
> 
> One can have hardlinks to directories
> without cycles provided that one does not allow any child of the
> directory to have a hardlink.

That sounds equivalent to no hard links (other than the usual parent
directory one).  If there's any directory with two links to it, then
there will be a cycle somewhere!

The tradeoff is the size of the cycle to the amount of memory and other
resources needed to clean up the cycle when rename/deletion changes the
directory graph structure.  Various artificial limits can be imposed,
such as not creating a link which would result in a cycle of more than
some number of files/directories (adjust so that cleanup fits in the
memory size of the machine).  Or just fail the cleanup if it is too
complex (user deletes individual items in the cycle then tries again).

Perhaps you are thinking about the speed improvement for cycle checking
that comes from marking directories as known to not contain children
pointing outside the graph rooted at that directory.  Then that directory
can be treated as an ordinary directory in the cycle cleanup procedure,
avoiding the need to trace down the links to all its descendants.  That's
essentially what your mount point restriction is.

- Alex
