From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: file as a directory
Date: Tue, 21 Dec 2004 08:16:56 -0500 EST
Message-ID: <37345179322-BeMail@cr593174-a>
References: <41C7B549.7090705@slaphack.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41C7B549.7090705@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

David Masover wrote on Mon, 20 Dec 2004 23:31:53 -0600:
> Would it work in a typical setup?  My instinct is no.

Depends on how big the directory loop and attached files are (basically all
the descendants of the directory you're trying to delete).  In most cases,
you don't have millions of directories in a loop.  With millions of files,
it might run out of RAM to keep track of locked inodes, making it impossible
to delete a directory in a loop that somewhere has millions of files as
descendants.  The awkward user work-around would be to move the files
somewhere else (files don't have descendants so that's feasible), delete
the directory, then move them back.

Of course, in a RAM disk, there can't be that many files :-)

- Alex
