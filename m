From: "Sergey S. Kostyliov" <rathamahata@php4.ru>
Subject: Re: bk pull problem (reiser4)
Date: Fri, 30 Jan 2004 15:33:26 +0300
Message-ID: <200401301533.26212.rathamahata@php4.ru>
References: <200401121528.14023.rathamahata@php4.ru> <401A42A9.70402@free.fr>
Reply-To: "Sergey S. Kostyliov" <rathamahata@php4.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16658-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <401A42A9.70402@free.fr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vince <fuzzy77@free.fr>
Cc: reiserfs-list@namesys.com

Hello Vince,

On Friday 30 January 2004 14:40, Vince wrote:
> Hi, have you found a solution to this problem ?
No, nothing has changed. I still can not pull from bk://bk.namesys.com/.

> I've got the exact same behaviour here...
>
> (BitKeeper version is bk-3.0.4 20031218201658 for x86-glibc22-linux
> Built by: lm@redhat71.bitmover.com in /build/3.0.x-lm/src
> Built on: Thu Dec 18 17:32:47 PST 2003)
>
> Sergey S. Kostyliov wrote:
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

-- 
                   Best regards,
                   Sergey S. Kostyliov <rathamahata@php4.ru>
                   Public PGP key: http://sysadminday.org.ru/rathamahata.asc

