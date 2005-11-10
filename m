From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Plugins: Pseudo-fun.
Date: Wed, 09 Nov 2005 19:51:00 -0500 EST
Message-ID: <262031722608-BeMail@AlexDualP3>
References: <200511090320.33063.pvh@uvic.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26836-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511090320.33063.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

Peter van Hardenberg wrote on Wed, 09 Nov 2005 03:20:32 -0800:
> Odd Behavior:
> ------------------
> 
> Regression problems immediately spring to mind:
> pvh@arroyo:~/reiser/test $ cd ....
> pvh@arroyo:~/reiser/test/.... $ cd ....
> pvh@arroyo:~/reiser/test/..../.... $ cd ....
> [...]
> Sure, it's right (.... is of type pseudo directory), but I wouldn't want my 
> directory tree traversal to ever end up in the bottomless pit of 4dot-doom by 
> mistake. 

I'd considered that before, with MIME types of attributes being an attribute
on an attribute.  Sure, you can ask for it and get it, but for the atomic
attributes (MIME string for one) the ..../whatever is a virtual directory
that's imagined on the fly by the file system, and is read only.  Don't try
to be too consistent - keep in mind that file systems are primarily a tool
for people to use, instead ask if it is useful and whether a crude
approximation to perfection would do.

As for ls and other file system using programs, they'll need to be updated
to avoid getting stuck in infinite loops with hard links anyway.  Or worked
around with some hackery like declaring .... as a symbolic link.

- Alex
