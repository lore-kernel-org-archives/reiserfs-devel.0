From: Chris Mason <mason@suse.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: 31 Oct 2002 16:30:04 -0500
Message-ID: <1036099804.14984.165.camel@tiny>
References: <20021031210828.45F4A216991@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021031210828.45F4A216991@server5.fastmail.fm>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JP Howard <jh_lists@fastmail.fm>
Cc: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>, Oleg Drokin <green@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, 2002-10-31 at 16:08, JP Howard wrote:
> On 31 Oct 2002 15:38:19 -0500, "Chris Mason" <mason@suse.com> said:
> <...>
> > The idea is that during boundless operations (creating a hole, and
> > truncates), the journal code wasn't properly reserving log blocks. 
> <...>
> 
> Chris, what can trigger this situation? We're currently running
> data=journal on 2.4.20pre in production--are we at risk?
> 

This bug is pretty hard to hit.  It has been in every single version of
journaling reiserfs, including 2.2.x.  So far, we've gotten two reports
of it in about 3 years (oddly, both were this month).

What can trigger it?  I honestly haven't been able to force the problem
to happen, it should require a very high load of processes doing
deletions (or hole creations), along with a very high system load in
general.

The logging code padds all the reservations for space in the log, making
it very hard to hit the hard limit of 1024 blocks per transactions.

Both sites that have hit the bug have a very large number of files
(millions), meaning that metadata operations will tend to log more
blocks, making the bug more likely.

If you have less than a million files, you'll probably never be able to
hit it.  I'm still going to try and get the fix into 2.4.20 though.

-chris


