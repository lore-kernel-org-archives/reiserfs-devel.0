From: Isaac Chanin <chanin@WPI.EDU>
Subject: Re: AMD64/Reiser4 testing and problems
Date: Sat, 1 Jan 2005 23:22:42 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0501012309480.15029-100000@ccc9.wpi.edu>
References: <41D71AE2.6050808@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23024-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41D71AE2.6050808@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hello all,

Just responding to my previous messages a bit more.  Not too much new to 
say, aside from a bunch of new bug report/error messages.

If you're interested they're at http://users.wpi.edu/~chanin/r4more.txt.

The old 'random' bug is still popping up.  Definitely looks like it has 
something to do with the reiser4_find_next_zero_bit function in bitmap.c.  
I've looked through the file (and includes) and haven't found anything 
obvious - but my C skills are quite what they should be for debugging 
something like this.

Also, there appears to be a new bug, or perhaps simple fluke event that 
resulted in some random file courruption - I've yet to formulate 
uninformed opnions about what caused that one yet, however.

Finally, if there's no need for more bug reports - apparently my last one 
did not warrant a patch or response (or some people just enjoy the season 
more than I do) - feel free to tell me.  I do recall reading that a 
x86_64 machine would be on its way to namesys soon.


Thanks,
Isaac

