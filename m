From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: [OT] memory issue with GNU find
Date: Thu, 24 Oct 2002 17:43:30 +0200
Message-ID: <20021024174330.34f2d72e.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11757-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>

Hi,

Sorry to be a little off topic here but here is the issue:

For legal reasons we need to list all files on a filer (reiserfs FS so not
_that_ offtopic :o).

Problem is that the filer is about 400Go and number of files according to 
/proc/fs/reiserfs/*/oidmap is about 20 Million files.

From what we've read and seen , find is eating up all memory to the point that
the filer start to swap and then crashes.

Would anyone know how to do that without bring the filer to its knees in terms
of memory ?

thanks,

Philippe
