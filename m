From: Oleg Drokin <green@namesys.com>
Subject: Re: Question on IICACHE and mount info (2.4.19-pre5)
Date: Mon, 8 Apr 2002 16:02:26 +0400
Message-ID: <20020408160226.A937@namesys.com>
References: <3CACE903.30901@mb.tu-ilmenau.de> <20020405090248.A6915@namesys.com> <3CB182B0.4030009@mb.tu-ilmenau.de>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CB182B0.4030009@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Mon, Apr 08, 2002 at 01:44:48PM +0200, Manuel Krause wrote:

> So, I made some semi-professional tests (only one run, and I have no 
> overview about my files size statistics) with my reiserfs partitions. 
> The data is only copied from the partitions backup counterpart that was 
> freshly created. There was KDE up during copying.
> First partition: 1958788 kB (my system)
> ---------------------------------------
Hm. Only 2 gigabytes... ;)

> notail:
> real    5m16.853s user    0m1.660s sys     0m53.090s
> notail+iicache:
> real    4m55.041s user    0m1.820s sys     0m52.650s

Ok, so for this partition there are actually some good times.

> notail+noborder+iicache:
> real    5m32.181s user    0m1.260s sys     0m48.590s

Noborder is evil right now, don't use it if you are not sure what are you
doing ;)

> Second partition: 4085252 kB (mostly archives)
> ------------------------------------------
> notail:
> real    11m3.024s  user    0m1.460s sys     1m26.780s
> notail+iicache:
> real    11m13.734s user    0m1.620s sys     1m26.650s

Hm, things are not so good here.

Too bad you do not have any file-size distribution statistics.

> Yes, I have differences. But I think they're not the ones we wanted to 
> see?! I double checked the lines I pasted to this email ;-)

I believe right now we have better patches to speed-up things both on read
(IDE only) and write that we are testing mostly locally.
iicache only speedups some reads on large files (I have not looked at
new iicache write support yet, so my observations are only can be applied 
up to iicache-9 patch)

Bye,
    Oleg
