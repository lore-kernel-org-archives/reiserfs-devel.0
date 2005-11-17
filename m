From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: More Slowdown or reiser4 update for 2.6.14-mm2
Date: Thu, 17 Nov 2005 20:22:43 +0300
Message-ID: <437CBC63.3050202@namesys.com>
References: <200511171447.41362.mail@earthworm.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26984-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511171447.41362.mail@earthworm.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Hesse, Christian" <mail@earthworm.de>
Cc: reiserfs-list@namesys.com

Hello

Hesse, Christian wrote:
> Vladimir V. Saveliev wrote:
>>Please try whether the attached patch improves anything. It simplifies
>>fsync by avoid commiting of transactions which do not modify file being
>>fsync-ed. 
>>
>>The patch applied to 2.6.14-mm2 with warnings, but that can be ignored.
> 
> Hi everybody,
> 
> I'm suffering the same problem, sync and fsync are horribly slow. I've written 
> a small test program:
> 
> http://www.earthworm.de/tmp/reiser4-fsync.c
> 
> with 2.6.13:
> sync()                                  = 0 <0.000198>
> fsync(3)                                = 0 <0.003353>
> 
> with 2.6.14 (with and without patch):
> sync()                                  = 0 <2.092873>
> fsync(3)                                = 0 <0.132579>

I tried your test on a box with reiser4 root fs:
2.6.13:
strace -T -e sync,fsync ./eworm xx
fsync(3)                                = 0 <0.158808>

2.6.14-mm2 +
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14-mm2/reiser4-for-2.6.14-mm2-1.patch.gz

strace -T -e sync,fsync ./eworm xx
fsync(3)                                = 0 <0.005373>


Would you please try whether 2.6.14-mm2 with fresh reiser4 update fsyncs better?
