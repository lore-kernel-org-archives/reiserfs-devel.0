From: David Masover <ninja@slaphack.com>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed
 by kernelnewbies.org regarding reiser4 inclusion)
Date: Tue, 01 Aug 2006 11:59:21 -0500
Message-ID: <44CF8869.2000501@slaphack.com>
References: <1154164364.2903.10.camel@laptopd505.fenrus.org> <44CBA4BF.80301@slaphack.com> <200607300132.28326.sarathmenon@gmail.com> <44CBC557.4050403@slaphack.com> <20060730115526.GB5336@hermes.uziel.local> <7a329d910607301410x6d6fb4f0sa946c8764be82ab1@mail.gmail.com> <20060730213757.GB6420@hermes.uziel.local> <20060730214237.GC6420@hermes.uziel.local> <7a329d910607310821p69e964f7t8d29300f3221cfa3@mail.gmail.com> <44CE286F.6000700@slaphack.com> <20060801085033.GA14461@hermes.uziel.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29404-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060801085033.GA14461@hermes.uziel.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Trefzer <ctrefzer@gmx.de>
Cc: Wil Reichert <wil.reichert@gmail.com>, Sarath Menon <sarathmenon@gmail.com>, reiserfs-list@namesys.com

Christian Trefzer wrote:
> On Mon, Jul 31, 2006 at 10:57:35AM -0500, David Masover wrote:
>> Wil Reichert wrote:
>>
>>> Any idea how the fragmentation resulting from re-syncing the tree
>>> affects performance over time?
>> Yes, it does affect it a lot.  I have no idea how much, and I've never 
>> benchmarked it, but purely subjectively, my portage has gotten slower 
>> over time.
> 
> Delayed allocation still performs a lot better here than the v3
> "immediate" allocation. In addition, tree balancing operations are
> performed on flush as well, so what you get on disk is basically an
> almost-optimal tree. Of course, this will change a bit over time, but
> with v4 it takes a lot longer for that to happen than with v3 afaict.
> There _has_ been some worthwile development in the meantime : )

Hmm.  The thing is, I don't remember v3 slowing down much at all, 
whereas v4 slowed down pretty dramatically after the first few weeks. 
It does seem pretty stable now, though, and it doesn't seem to be 
getting any slower.

I've had this particular FS since...  hmm...  Is there an FS tool to 
check mkfs time?  I think it's a year now, but I'd like to be sure.

If not, I'll just find the oldest file, but the clock on this machine 
isn't reliable (have to set it with NTP every boot)...
