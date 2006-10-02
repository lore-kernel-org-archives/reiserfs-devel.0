From: rvalles <rvalles@es.gnu.org>
Subject: Re: BitTorrent+Reiser4: curiouser and curiouser
Date: Mon, 2 Oct 2006 17:39:47 +0200
Message-ID: <17964.2468611293$1159803648@news.gmane.org>
References: <4513827A.50809@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4513827A.50809@slaphack.com>
Sender: <rvalles@eww.ath.cx.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Fri, Sep 22, 2006 at 01:28:10AM -0500, David Masover wrote:
> Azureus had a problem.  Once it got up to a good clip downloading, it 
> would thrash the disk.  It would thrash the disk, and the system, so 
> hard that even web browsing was difficult, due to disk access being 
> many, many times slower than Internet access, even an Internet which is 
> being hogged by BitTorrent.
> 
> After changing Azureus' cache to 32 megs, and telling it not to write 
> files immediately, I thought I had the problem solved -- no thrashing at 
> all.  Until the cache got full.  Then:  Thrashing.  Less freqent, but 
> much more vigorous -- Azureus becomes extremely unresponsive for a few 
> minutes.

I think this happens with any filesystem when using Azureus; that client
insists on doing its own caching, ignoring the cache linux has, and also
does waste hundreds of mb in buffers. Too bad it's the only client with
the so popular "azureus DHT" which works on GNU/Linux.

I personally recommend this one:
http://libtorrent.rakshasa.no

It does use mmap() for file IO, being very fast and using little RAM and
CPU.

Next time I need Azureus DHT I'll try if I can get to run some Windows
client on Wine.
-- 
- Do you study theories? - Oh yes! Theories are fun. - How do you use them? - When I must act, theories are too slow. To act, I must know.
