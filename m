From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files
 according to semantic.
Date: Thu, 18 Mar 2004 19:32:08 -0500 EST
Message-ID: <92273267059-BeMail@cr593174-a>
References: <405A2AFE.8060107@slaphack.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17301-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <405A2AFE.8060107@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

David Masover wrote on Thu, 18 Mar 2004 17:04:30 -0600:
> | David> What about a reiser4 plugin?
> |
> | I would think that would count as being in the filesystem level.
> 
> Yet it doesn't involve writing a *new* filesystem, which is I think what
> was being suggested?  Alexander?

I was concerned that new features should also be available to all
programs, preferably through the existing file system API (open,
close, readdir, etc), rather than having a separate API layer (adding
a few functions is OK).  I don't care if it's a new file system under
the hood, or enhancements to an existing one; the important thing is
that all programs be able to use it easily.

For example, you could add a mkquery() to the usual API to make a
virtual directory that contains the results of a query (query
patterns specified as an argument to mkquery).  I'd be satisfied if
other software can open that virtual directory just like a regular
one, and use readdir on it.  Of course, creating a file in the
virtual directory would return an error code (or you could have
that operation automagically add attributes to the new file which
would make it satisfy the query).

The general idea is to avoid having multiple application programming
interfaces.  Keep it unified and you get more power through synergy.
Such as being able to use grep or ffmpeg on all files in a virtual
query results directory.

- Alex

P.S. Normally I wouldn't use "synergy", but it makes sense here.
