From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: More on Hard Links (was A bold idea (Re: Carrying Attributes too
 Far))
Date: Sat, 06 Dec 2003 10:31:00 -0500 EST
Message-ID: <1569161060-BeMail@cr593174-a>
References: <3FD136D2.4070808@ninja.dynup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16262-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD136D2.4070808@ninja.dynup.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <jedi@ninja.dynup.net>
Cc: reiserfs-list@namesys.com

David Masover wrote on Fri, 05 Dec 2003 19:54:26 -0600:
> >Incidentally, renaming files is a superset of the delete operation.
> >Implement that first, and you have delete for free.
> >  
> >
> If only it was that easy.  When you rename a folder, you don't usually 
> do a recursive rename of everything inside.  When you delete a folder -- 
> you don't, unless it's "rmdir".  You recursively delete each file 
> inside, and it's that kind of operation that creates problems for hard 
> links to directories.

Actually, renaming also is recursive.  The obvious case is when you
rename a file over an existing file (or directory), which implies the
whole deletion mechanism is needed.

Also, at least for the AGMS link mechanism (or perhaps for any system
that allows multiple parent directories), it has to do a graph traversal
to find out which parent links are still valid, and which need to be
adjusted if their parent has been changed.  If you see the example at
the bottom of http://web.ncf.ca/au829/BeOS/AGMSLinkExplanation.txt you'll
notice that deleting something can cause a sweeping re-evaluation of who
is the parent to what.  The same thing would happen if you rename (move)
a parent directory to be a subdirectory of one of its children.

- Alex
