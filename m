From: Richard Heycock <rgh@roughage.com.au>
Subject: Re: Network Raid (possibly OT sorry)
Date: Mon, 15 Mar 2004 17:07:24 +1100
Message-ID: <1079330844.1289.1.camel@boadicea>
References: <4054D94A.8080400@bernztech.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17210-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4054D94A.8080400@bernztech.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

You might want to consider lustre http://www.lustre.org.

rgh


On Mon, 2004-03-15 at 09:14, David Bernick wrote:
> hello fellow Reiser-lovers.
> 
> So Reiser rocks. It's great for a single system. But recently i've wanted to 
> build a network raid: A disk on host-a be mirrored in real-time (or near 
> real-time) to a disk on host-b. I know DRBD does this, but I'd like to read from 
> both disks and write to a master. DRBD makes the slave disk non-readable. I've 
> been playing with Intermezzo, which sort of does the trick but it seems to be 
> fairly unsupported as far as active mailing lists are concerned.
> 
> So the question, as off-topic as it may be, is what do you use for a mirrored 
> (replicated?) filesystem, if you use one? Any suggestions would be great.
> 
> Thanks!
> 
> d
-- 
"It is possible to make things of great complexity out of things
 that are very simple. There is no conservation of simplicity"
 -- Stephen Wolfram

Richard Heycock <rgh@roughage.com.au>
tel : 0410 646 369
key fingerprint : 909D CBFA C669 AC2F A937 AFA4 661B 9D21 EAAB 4291
