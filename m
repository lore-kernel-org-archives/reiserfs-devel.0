From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: file as a directory
Date: Tue, 21 Dec 2004 19:47:45 -0500 EST
Message-ID: <78793619231-BeMail@cr593174-a>
References: <200412211629.iBLGTljB008731@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412211629.iBLGTljB008731@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: reiserfs-list@namesys.com

Horst von Brand wrote on Tue, 21 Dec 2004 13:29:46 -0300:
> How does the user know that this is a directory cycle being removed? Also,
> while I nuke a particular link into the cycle, somebody else could be
> creating a new one...

The error code would tell you.  If someone else is adding links while you're
trying to delete then the locking will either lock them out, or wait a moment
for them to finish, or fail if a deadlock happened.

> Nice prototype. Can we now go back to real filesystems?

I hope so!  Still, the prototype does help point out problems and possible
solutions - exploring the dark areas of file system knowledge.  Plus it's
useful for speeding up certain operations on BeOS, which doesn't have as
good disk caching (fixed 32MB cache size) as Linux.

- Alex
