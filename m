From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: development
Date: Tue, 06 Jan 2004 21:44:33 -0500 EST
Message-ID: <8567103824-BeMail@cr593174-a>
References: <20040107022330.GA2930@zero>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16428-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040107022330.GA2930@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Tom Vier wrote on Tue, 6 Jan 2004 21:23:30 -0500:
> On Tue, Jan 06, 2004 at 11:25:18PM +0300, Hans Reiser wrote:
> > We use UML for everything it can be used for.
> 
> what about putting the core code in a lib and using a file for storage? once
> it stabilizes, remove the userland stuff and hook it up to the vfs. [...]

I just use lots of dprintf statements to write debugging messages out to
a serial port and a log file, and avoid writing buggy code in the first
place (lots of sanity checks, etc).  But that was for a fancy RAM file
system, a one person project, not something as big as ReiserFS.  I also
had a user level file system test program which was useful for comparing
how different file systems handled, well, just about everything.  Old
screen shot at http://web.ncf.ca/au829/BeOS/AGMSRAMFSMounter.screen.gif

Admittedly I did develop some components in user-land, like the pattern
matching code or the AVL trees.  But most debugging (there wasn't much)
just needed print statements.  I also know of other people that use a
VFS simulator / test harness for their file system code.  But that's on
BeOS so it won't be too useful for Unix style development.

- Alex
