From: Steve Lord <lord@xfs.org>
Subject: Re: XFS corruption during power-blackout
Date: Wed, 29 Jun 2005 12:56:12 -0500
Message-ID: <42C2E0BC.8040508@xfs.org>
References: <20050629001847.GB850@frodo> <200506290453.HAA14576@raad.intranet> <556815.441dd7d1ebc32b4a80e049e0ddca5d18e872c6e8a722b2aefa7525e9504533049d801014.ANY@taniwha.stupidest.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24804-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <556815.441dd7d1ebc32b4a80e049e0ddca5d18e872c6e8a722b2aefa7525e9504533049d801014.ANY@taniwha.stupidest.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Wedgwood <cw@f00f.org>
Cc: Al Boldi <a1426z@gawab.com>, 'Nathan Scott' <nathans@sgi.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Chris Wedgwood wrote:
> On Wed, Jun 29, 2005 at 07:53:09AM +0300, Al Boldi wrote:
> 
> 
>>What I found were 4 things in the dest dir:
>>1. Missing Dirs,Files. That's OK.
>>2. Files of size 0. That's acceptable.
>>3. Corrupted Files. That's unacceptable.
>>4. Corrupted Files with original fingerprint. That's ABSOLUTELY
>>unacceptable.
> 
> 
> disk usually default to caching these days and can lose data as a
> result, disable that
> 

There are IDE drives where the vendor will tell you that you will
drasticly shorten the life of a drive if you turn off caching.
There are also cool bits of technology which use the rotational
energy of the spinning down drive to dump the cache out to a
special track (or this may be an urban legend, not sure). Problem
is, no one but the vendors really knows what any particular
disk is going to do when you pull the plug.

I did spend a bunch of time once ensuring that when you typed
sync on xfs you could pull the power right after that and
everything from before the sync survived. There have been a
lot of changes both in xfs and the surrounding kernel since
then. I do not know if anyone has attempted this effort
again recently.

If you care sufficiently about your data to want to do power fail
testing then, even assuming the filesystem works perfectly:

a) have a working, tested, regular backup policy
b) keep the backups in a different building
c) buy a UPS.

Steve
