From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: "Metas"
Date: Wed, 28 Apr 2004 12:32:08 +0300
Message-ID: <20040428093208.GD29226@nysv.org>
References: <200404280506.i3S56jXb022934@sirius.cs.pdx.edu> <87d65sbnrr.fsf@uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18268-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87d65sbnrr.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

On Wed, Apr 28, 2004 at 02:49:12AM -0400, Hubert Chan wrote:
>/foo/bar into, say, /proc/metas/foo/bar.  What Markus is talking about
>is having a file called, say /proc/fs/reiser4/metas, and if you cat
>that file, it will spit out the name of the metas directory.

Yes, were it for the current directory (/sys always changing its contents)
or one global name.

The current directory mv-supporting thing is like death itself and should
not be implemented. Nor should mv support be implemented without sys
support because then people may forget their metadata directory name
without any chance of looking it up, except for maybe something in debugfs
or somewhere, which is not implemented afaik.

Consider how much work this would be due to bickering.

>I don't like it because I think that Reiser4 should be consistent.

I agree.

>Making users look up the name from /proc/fs/reiser4/metas I think is a
>lot worse than making them use a long name for the metas directory.  And

Mmmmyeah, but I don't think having the directory name exported in 
something like that is a bad idea per-se, as long as it exports a
global, static name. If we have a situation where different people
use different names. Which will happen if we have a clashing ./metas/
directory.

>Yet another option is to standardize on a long, extremely unlikely to
>clash name as the standard way to access the metadata (maybe something
>like "sys.metadata"), and define a short name, which is probably defined
>at compile time, which can be looked up through something like
>/proc/fs/reiser4/metas_abbrev.  That way, users (and scripts) get a
>consistent interface, but if they want to save typing, they can look up
>the short name.

And the abbreviation would never conflict, because when a process tries
to write to the abbreviated name, the file system realizes this and
goes "oh shit, I must make way to tar xf, *poof*"?

Incredible amounts of work again in vain.

Besides, length has little to do with it. Consider ..metas. It's not
long but what are the odds of accidental clashing?

Just my two cents, which I seem to contribute over and over again ;)

-- 
mjt

