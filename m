From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: A bold idea (Re: Carrying Attributes too Far)
Date: Tue, 09 Dec 2003 09:03:11 +0100
Sender: hjclaes@web.de
Message-ID: <1070956991.3579.12.camel@schlappix.schnulli.de>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk>
	 <3FCE3716.8000509@namesys.com>
	 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
	 <3FD00272.7040607@ninja.dynup.net>
	 <1070617453.5605.13.camel@schlappix.schnulli.de>
	 <3FD4E50D.6070805@nrao.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16295-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD4E50D.6070805@nrao.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Boyd Waters <bwaters+moz@nrao.edu>
Cc: David Masover <jedi@ninja.dynup.net>, reiserfs-list@namesys.com

Am Mo, 2003-12-08 um 21.54 schrieb Boyd Waters:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Heinz-Josef Claes wrote:
> 
> | I think hard linking directories is a very good idea. The should be a
> | count for the number of hard links and it should be handled like with
> | normal files. I directly have an application with would have a great
> | benefit of this kind of hard linked directories, but up to now they are
> | not available in linux :-(
> 
> I use
> 
> mount -o bind path/to/subdirectory path/to/mountpoint
> 
> as a sort-of "hard-link" directories...
> 
Yes, that would look a little bit like a hard link. But I want to use it
as a possiblity for my backup tool (see below). It makes a backup to
another hard disk and hard links to files with a contents which is
already in the backup. If a hole directory had not changed, I could make
a link to the previous one and that's all. Now I have to mkdir the
directories and hard link every single file. I could use much less space
if there were an option to hard link directories (with a count for
proper deletition).

Regards,

 
Heinz-Josef Claes                     hjclaes@web.de
project: http://sourceforge.net/projects/storebackup
      -> snapshot-like backup to another disk



