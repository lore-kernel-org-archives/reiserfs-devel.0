From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  bk pull problem (reiser4)
Date: Sat, 31 Jan 2004 12:35:28 +0300
Message-ID: <20040131123528.A31016@t-raenon.nmd.msu.ru>
References: <200401121528.14023.rathamahata@php4.ru> <200401151803.20907.rathamahata@php4.ru>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16671-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200401151803.20907.rathamahata@php4.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Sergey S. Kostyliov" <rathamahata@php4.ru>
Cc: reiserfs-list@namesys.com


here comes promised follow-up.

i investigated the problem, and it seems like there is TWO reasons
why you could not currently pull from reiserfs public bk repository.

1. in version 3.0.4 Bitmover changed their licensing, and (wow)
put interactive confirmation in the binary, which eventually prevented
bkd from working. (alleviated)

2. 

thebsh>
=================================  Error   =================================
Unable to obtain permission to use this version of BitKeeper (bk-3.0.4)
from lease.openlogging.org.  That server issues certificates to use BK
for openlogging for 30 days at a time.  The bk binary needs to be able
to make a http connection to lease.openlogging.org at least once a month.

Look at 'bk help url' if you need to tell 'bk' about a proxy.
============================================================================

thebsh>telnet lease.openlogging.org 80
Trying 66.216.127.34...
Connected to lease.openlogging.org.
Escape character is '^]'.
GET /

HTTP/1.0 503 Error
Sat, 31 Jan 2004 09:32:41 GMT
Server: bkhttp/0.3
Content-Type: text/html

[dd]

Connection closed by foreign host.


seems like we cant acquire server certificate for some reason, i contacted
Bitmover with this issue, and hopefully things got resolved in timely fashion.
i'll keep you updated. thanks for patience.
`
Thu, Jan 15, 2004 at 06:03:20PM +0300, Sergey S. Kostyliov wrote:
> On Monday 12 January 2004 15:28, Sergey S. Kostyliov wrote:
> > Hello all,
> >
> > I can not pull from reiser4 tree,
> > bk pull is just waited indefinitely:
> > rathamahata@arise reiser4 $ bk parent
> > Parent repository is bk://bk.namesys.com/bk/reiser4
> > rathamahata@arise reiser4 $ bk pull
> > Pull bk://bk.namesys.com/bk/reiser4
> >   -> file://usr/local/src/bk/reiser4
> > (nothing more)
> 
> The problem hasn't gone away. I believe there are no any network problems
> on my side. Is `bk clone` allowed for namesys's bk trees? Perhaps there
> was some kind of announcement that I've missed?
> 
> Any hints will be appreciated.
> 
> >
> > but bk clone is still posiible.
> >
> > traceroute to thebsh.namesys.com (212.16.7.65), 30 hops max, 40 byte
> > packets 1  breuss-10.ws.ehouse.ru (192.168.114.10)  1.251 ms  2.773 ms 
> > 28.617 ms 2  hobbit-gw.ehouse.ru (193.111.92.33)  11.445 ms  9.780 ms 
> > 9.920 ms 3  express-ehouse.express.ru (212.24.42.9)  9.884 ms  9.800 ms 
> > 9.914 ms 4  LYNX-M9.ATM6-0.30.M9-R1.msu.net (193.232.127.230)  4.985 ms 
> > 12.488 ms  4.978 ms 5  LYNX-M9.ATM6-0.30.M9-R1.msu.net (193.232.127.230) 
> > 6.080 ms  5.403 ms * 6  thebsh.namesys.com (212.16.7.65)  5.847 ms  5.469
> > ms  5.147 ms
> 
> -- 
>                    Best regards,
>                    Sergey S. Kostyliov <rathamahata@php4.ru>
>                    Public PGP key: http://sysadminday.org.ru/rathamahata.asc

-- 
"the liberation loophole will make it clear.."
lex lyamin
