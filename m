From: Scott Young <youngs1@sunyit.edu>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Mon, 29 Mar 2004 23:22:07 -0500
Message-ID: <1080620527.31924.117.camel@localhost.localdomain>
References: <20040329205339.74202.qmail@web25004.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17586-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040329205339.74202.qmail@web25004.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Mon, 2004-03-29 at 15:53, Narcoleptic Electron wrote:

> > This name is
> > important to pick well 
> > because it will likely set a long precedent. 
> 
> Absolutely.


Regular can be accessed as directories to access their attributes, so
there is no name collision there.  Files can be accessed as directories
by putting a / at the end of their name.  Folders are more complicated,
but I think it should be done by just adding a slash after the full
directory name (full as in including a trailing slash, so therefore
there would be two slashes at the end to access an attribute). 
/home//attribute would be the an attribute on the home directory. 
However, this leaves an inconsistency between accessing attributes
between file types.  If given /some/path, do I put 1 or 2 slashes after
it to access the attribute?  This could lead to potential security
problems with a file being replaced with a directory with fake file
attributes.  Therefore, I think the double-slash should also be used for
regular files.  For example:  /etc/.passwd//attribute

Could ..metas be renamed to a null string to get this effect on
directories?




