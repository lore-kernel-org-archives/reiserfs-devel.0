From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: reiserfs rebuild-tree time?
Date: Thu, 11 Mar 2004 10:29:10 +0100
Message-ID: <20040311102910.75cd164a@philou.gramoulle.local>
References: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17174-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

On Thu, 11 Mar 2004 01:27:47 -0500 (EST)
jlewis@lewis.org wrote:

  | That was about 13 hours ago...and its still running.  I didn't
  | think to redirect output to a file, but AFAIK, it's in Pass 3 now.  Lots
  | of file names are scrolling by, but only on the last line of my terminal,
  | so it's difficult to tell what its up to.

Well, not using "-q" option of reiserfsck is a major slowdown, especially if
you use a serial console. I always use it with -q and -l /path/to/logfile.log
which i tail if i want to know the reiserfsck progress.

  |   Am I correct in assuming that stopping
  | reiserfsck before the rebuild-tree finishes would be "bad"...i.e. we won't
  | be able to access the data, and would have to start over anyway?

Don't ever do that :) or then prepare to go there:

http://www.namesys.com/support.html

  | 
  | Is there any possibility of getting to the data (most of it anyway) on
  | this partition if we have to stop the rebuild before it completes?...i.e.
  | if it really is caught in a loop.

Again, *don't* stop it, just wait. I know it's always too long but you need yo be patient if
you want your data back :)

  | 
  | The system is a dual PIII-733.  Other than the rebuild and a few admins
  | ssh'd in to keep an eye on it, the system is idle.  I'm not seeing a whole
  | lot of activity (1MB/s in, 1MB/5s or so out according to vmstat) and CPU
  | idle 98%.  If CPU and disk i/o aren't limiting it, what's causing the
  | rebuild-tree to take so long?

Maybe broken hardware ? just a guess.

Thanks,

Philippe
