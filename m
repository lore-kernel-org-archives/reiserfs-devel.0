From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: [RFC] Pathname Semantics with //
Date: Fri, 10 Sep 2004 12:37:55 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <200409101237.55474.christian.mayrhuber@gmx.net>
References: <20040909201301.1165215D64@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040909201301.1165215D64@mail03.powweb.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org

On Thursday 09 September 2004 22:17, David Dabbs wrote:
> 
> > Christian Mayrhuber
> > 
> > What about using // as some URI entry point?
> > An URI looks like:
> > PROTOCOL://PROTOCOL_SPECIFIC_NAMESPACE_IMPLEMENTATION
> > 
> I considered that in that //: is implicitly file://, but didn't make it
> explicit in the proposal. Perhaps //: could be a legal alias for //file://.

Sorry, I wasn't clear about this.
I thought more of the way //meta:// would mean //:  == filesystem + metadata 
exposed.
//file:///some/path equals /some/path == filesystem strictly posix conformant

How the entry points are named does not really matter as long they are 
standardized.

I just wanted to keep the door open for userspace hooks that work on all 
filesystems, not just reiser4.

Even some ext3 user may want to "cd //tar://myarchive.tgz" at some time.

-- 
lg, Chris
