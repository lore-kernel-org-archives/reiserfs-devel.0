From: jlewis@lewis.org
Subject: Re: reiserfs rebuild-tree time?
Date: Thu, 11 Mar 2004 09:52:18 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0403110944230.1969@web1.mmaero.com>
References: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com> 
 <1078997330.9476.246.camel@tribesman.namesys.com> 
 <Pine.LNX.4.58.0403110848380.1969@web1.mmaero.com>
 <1079014534.9475.265.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17178-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079014534.9475.265.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, 11 Mar 2004, Vladimir Saveliev wrote:

> > > Yes, this looks like reiserfsck got into endless loop. If it is still
> > > there lets break and fix reiserfsck bug.

Actually, I've just straced reiserfsck for a while and in 20mb of strace
output, I see it's written to stdout more than 60000 message file names
(all unique) for this one user it's been 'stuck' on since last night.  So
I'm not so sure it's looping, but just taking an awful long time on a dir
with some insane number of files in it.  If that's the case, I'd hate to
stop it just to start over and take as long again.

I ran this reiserfsck via a session logged in (across a 100mb ethernet)
via ssh.  Is it possible that not using -q could make it orders of
magnitude slower than it would have been if I'd used -q -l /some/logpath ?
If so, maybe it is worth stopping and restarting just to add those
options.

----------------------------------------------------------------------
 Jon Lewis *jlewis@lewis.org*|  I route
 Senior Network Engineer     |  therefore you are
 Atlantic Net                |
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
