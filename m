From: Tom Vier <tmv@comcast.net>
Subject: Re: write barrier patches for 2.4.21
Date: Wed, 27 Aug 2003 18:03:37 -0400
Message-ID: <20030827220337.GB4886@zero>
References: <20030825170849.GA14811@mfa.kfki.hu> <20030826214624.GA410@zero> <20030827064103.GA29131@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15463-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030827064103.GA29131@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs List <reiserfs-list@namesys.com>

On Wed, Aug 27, 2003 at 10:41:03AM +0400, Oleg Drokin wrote:
> There was a discussion about that on Kernel Summit 2003 and general opinion was that SCSI
> does not need the WB stuff at all as it does the correct thing anyway.

i found this, but no real details. do you have a better link? or could you
tell me why scsi drives don't need wb's? afaik, they don't have nvram cache.
so, the danger is still there, even if small (unless i'm wrong).

http://lwn.net/Articles/40850/

> But since the the barrier flags are visible in io requests, actual device drivers
> are free to do something when met with barrier requests or to ignore it.
> The only concern is probably raid cards that show bunch of IDE drives as a SCSI device.

anyone who has more info, please post. 8) i'm very interested. too bad there
aren't video streams of lks, like there were in the past.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
