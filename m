From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Thu, 26 Jun 2003 10:28:21 +0400
Message-ID: <20030626062821.GA11176@namesys.com>
References: <20030623090258.GA12259@namesys.com> <3EF6C83F.6060702@namesys.com> <3EF702CC.9050005@g-house.de> <20030624131904.GA460@namesys.com> <3EF86928.7080504@g-house.de> <20030624151940.GC21845@namesys.com> <3EF888B2.4000900@g-house.de> <3EF8EFF0.6020207@g-house.de> <20030625054031.GA11576@namesys.com> <3EF9A0F6.4030401@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14702-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EF9A0F6.4030401@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Wed, Jun 25, 2003 at 03:17:42PM +0200, Christian Kujau wrote:

> under both (2.5.65+2.5.69) i was able to mkreiserfs sde2. mounting the 
> fs went ok, but copying data (cp -a /lib /mnt/reiserfs) brought several 
> kernel-errors (see https://ephigenie.kicks-ass.net/browse/reiserfs/).

This "buffer layer error" problem was fixed in 2.5.71 or something like that, I think.
I found it while merging "variable blocksize" patch. (that allowed me to have
the same situation in which you are - blocksize is less than pagesize, only on x86)

> but: diff -r showed _no_ differences betweeen the directories, a 
> following reiserfsck brought no vpf-10680 anymore!
> so i'd say the problem occurs somewhere between 2.5.69 and 2.5.70.

Hm. Ok, thank you for the testing.
I am going to read the patches submitted at that time again.

Bye,
    Oleg
