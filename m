From: David Masover <ninja@slaphack.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Wed, 26 Jul 2006 20:29:17 -0500
Message-ID: <44C816ED.3070304@slaphack.com>
References: <200607242151.k6OLpDZu009297@laptop13.inf.utfsm.cl> <200607251708.13660.vda.linux@googlemail.com> <20060725204910.GA4807@merlin.emma.line.org> <44C6A390.2040001@slaphack.com> <20060726112039.GA18329@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29221-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060726112039.GA18329@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Matthias Andree wrote:
> On Tue, 25 Jul 2006, David Masover wrote:
> 
>> Matthias Andree wrote:
>>> On Tue, 25 Jul 2006, Denis Vlasenko wrote:
>>>
>>>> I, on the contrary, want software to impose as few limits on me
>>>> as possible.
>>> As long as it's choosing some limit, I'll pick the one with fewer
>>> surprises.
>> Running out of inodes would be pretty surprising for me.
> 
> No offense: Then it was a surprise for you because you closed your eyes
> and didn't look at df -i or didn't have monitors in place.

Or because my (hypothetical) business exploded before I had the chance.

After all, you could make the same argument about bandwidth, until you 
get Slashdotted.  Surprise!

> There is no way to ask how many files with particular hash values you
> can still stuff into a reiserfs 3.X. There, you're running into a brick
> wall that only your forehead will "see" when you touch it.

That's true, so you may be correct about "less" surprises.  So, it 
depends which is more valuable -- fewer surprises, or fewer limits?

That's not a hypothetical statement, and I don't really know.  I can see 
both sides of this one.  But I do hope that once Reiser4 is stable 
enough for you, it will be predictable enough.

> But the assertion that some backup was the cause for inode exhaustion on
> ext? is not very plausible since hard links do not take up inodes,
> symlinks are not backups and everything else requires disk blocks. So,

Ok, where's the assertion that symlinks are not backups?  Or not used in 
backup software?  What about directories full of hardlinks -- the dirs 
themselves must use something, right?

Anyway, it wasn't my project that hit this limit.
