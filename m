From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Wed, 18 Jun 2003 19:26:26 +0400
Message-ID: <20030618152626.GA17240@namesys.com>
References: <3EF07AFB.8060303@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14611-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EF07AFB.8060303@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Wed, Jun 18, 2003 at 04:45:15PM +0200, Christian Kujau wrote:
> i'm running linux 2.5.70/2.5.72 and have a 2GB fs with Reiserfs on it.
> from time to time reiserfsck the fs and some corrutions came up, which 
> were fixed as suggested by --fix-fixable.
> how comes? the data on the fs is not that important, it's a cache for 
> Debian packages. I'm just curious _why_ there are corruptions anyway, 
> since there is not even heavy load on the fs.

Hm, interesting. Do you had crashes/unexpected shutdowns before corruptions appears
or are they appear without any reason at all?

> /debian/dists/woody/main/binary-powerpc/Packages.gzvpf-10680: The file 
> [2256 3144] has the wrong block count in the StatData (3344), should be 
> (1680)
> /source/Sources.gzvpf-10680: The file [2275 2349] has the wrong block 
> count in the StatData (1432), should be (720)
> /contrib/binary-powerpc/Packages.gzvpf-10680: The file [2225 523] has 
> the wrong block count in the StatData (80), should be (40)
> /source/Sources.gzvpf-10680: The file [2246 2785] has the wrong block 
> count in the StatData (48), should be (24)
> /non-free/binary-powerpc/Packages.gzvpf-10680: The file [2289 2782] has 
> the wrong block count in the StatData (104), should be (56)
> /source/Sources.gzvpf-10680: The file [2310 2471] has the wrong block 
> count in the StatData (56), should be (32)
> /non-US/dists/woody/non-US/main/binary-powerpc/Packages.gzvpf-10680: The 
> file [2627 2495] has the wrong block count in the StatData (88), should 
> be (48)
> finished 

Are there more files on this fs at the time of check?

> the machine was booted yesterday evening, and is booted once in a week 
> or so. it's an Alpha/EV45, Debian testing on it, glibc 2.3.1.

Well, I guess it's time to clear the dust off our alpha and do some testing.

Bye,
    Oleg
