From: Andrew Clausen <clausen@gnu.org>
Subject: Re: what do you do that stresses your filesystem?
Date: Tue, 24 Dec 2002 08:14:03 +1100
Message-ID: <20021223211403.GB1116@gnu.org>
References: <3E06F360.7000708@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E06F360.7000708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Mon, Dec 23, 2002 at 02:28:32PM +0300, Hans Reiser wrote:
> We were discussing how to optimize reiser4 best, and came to realize 
> that us developers did not have a good enough intuition for what users 
> do that stresses their filesystem enough that they care about its 
> performance.

Something else you might want to do is measure "commit latency"...
the time between file operations being made by userland, and those
operations becoming durable (i.e. getting committed into the log).

If you can benchmark this, it might give users more confidence.
(When I clicked save, it did, actually, save!)

This is kind of related to real-time stuff, which is another thing
you might want to test.  Eg: audio/video playback... can reiserfs
sustain IO bandwidth well, without falling behind occasionally?
(i.e. maintaining low latency)

XFS has (had?  I think it's only the irix port) an ioctl to tell
the OS "I want to read 300kb/s with maximum 0.1ms latency on fd 3".
(The ioctl() would fail if Irix couldn't guarantee that)

I'm not saying this is useful for everyone, just it should help
you understand the performance better...

Cheers,
Andrew

