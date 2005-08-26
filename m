From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: reiser fs slow on mksf and mount
Date: Fri, 26 Aug 2005 14:07:30 -0400
Message-ID: <1125079650.5549.87.camel@localhost.localdomain>
References: <1125074717.5549.44.camel@localhost.localdomain>
	 <430F4B91.7030909@namesys.com>
	 <1125076138.5549.65.camel@localhost.localdomain>
	 <1125076558.5549.72.camel@localhost.localdomain>
	 <430F5226.50701@namesys.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-6Xrx2ynG2mwxVJChb17Z"
Return-path: <reiserfs-list-return-25652-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430F5226.50701@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--=-6Xrx2ynG2mwxVJChb17Z
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2005-08-26 at 21:32 +0400, Vladimir V. Saveliev wrote:
> Hello
> 
> > On Fri, 2005-08-26 at 13:08 -0400, Ming Zhang wrote:
> >>i think 3.2TB partition is not that big these days right?
> >>
> >>i would think some people that hold millions of files will have much
> >>larger partition than this.
> >>
> >>so you think this is a normal speed for such size partition?
> >>
> 
> No. That was joke actually.
> Speed of mkfs.reiserfs confuses me.

:) i captured vmstat 1 and iostat 1. i bet u will be confused more.

it is pretty big for email so i attached them.


> As you did answer about whether all disks were spinning - I suppose that they were.

no


> Can you please run vmstat 1  or iostat 1 while mkreiserfs is running?
> 
> >>also iostat 1 -k shows that during mount, there are small size read
> >>happen each second. so this is because read meta data and metadata is
> >>not continuous on disk?
> >>
> 
> Yes. On mount reiserfs reads all bitmap blocks to memory. Those blocks are spread over whole disk. There is workaround for this problem.
> 
> >>>>
> >>>There is a patch to cure this problem.
> >>>http://www.mail-archive.com/reiserfs-list@namesys.com/msg18442.html
> >>>Please note that it is experimental one.
> >>>
> >>>>

Does reiserfs4 have any improvement on this?

Thanks!

Ming


--=-6Xrx2ynG2mwxVJChb17Z
Content-Disposition: attachment; filename=iostat-log.gz
Content-Type: application/x-gzip; name=iostat-log.gz
Content-Transfer-Encoding: base64

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


--=-6Xrx2ynG2mwxVJChb17Z
Content-Disposition: attachment; filename=vmstat-log.gz
Content-Type: application/x-gzip; name=vmstat-log.gz
Content-Transfer-Encoding: base64

H4sICBFaD0MAA3Ztc3RhdC1sb2cAzZnbUuM8DIDveQq/ADM+xYfHYVmY7QULQ3+G4e3XkpySElmV
y38BA2mapB+SrKP78vp8fzS3nz9PD0/Prx+f7+He8f3uhc5ubw/P/erx4/jfw1O/fP/yBi835tWY
X8aY4/vL7/by+Prw0F5+vT0+GnN/d/8H3h0PcHg2cOOARzg//IXTJsvb0Rw/zOG3eb+7MdbAL/xY
U6Kri2+ndanJGFeiLXRnPaQFjjEYZ4Mz+GR7Dn7hJM7iTkdnLZJNwmsNV9vJDZ1/4pKPgEvWIs75
M5xP5YRb4NTFYkiiWM3izqXLMQVfttLtcPYrrj3XVHcmNmLe4Xzq0kUOR8emKPwleO9W6eDiV21T
TbmJ50IusfPSTrwQPTwTS0BcBNl8MD43CSdxZHdfmjQhZHgffBePJLyKByvuwmJVvOq3PG+H8nn0
lRC7r7RjrUMceOAIF5rQ7VDRqa1OPInnFnjG4ccCwVDpWq7CkbYubHBq8SIrXlPX13SF9ThcFy/O
iJfsmGdRvIxBHMocj0kstBq+pI3zXVJXwtkmtOs5xqdv4zAT+FA31lPiApNY1sgNM8qWMa5HBl6I
ysAVeKZUWNtlYYz38uML5KzxemBs04DaeFwWvcaRBVx35LBZi4vi5SSIB4WnixfjFC8yaa/7SsAL
rZp9l7cWIYq0qMrKEo6SvLUzq7vyhDRKketUq1viGEeRSylHW9MkXlfXz6gr8XoJ35pPqy6XRrv1
SDxdVpZwFBt5m+Qvalv9mEexUd1mNS6J13ELl1koE1QK3fJt3Jnx9onFz0qXoKQVCrS8Nx7Lo8hY
+G4UApcSQd33Kwyu9t6bxQVsWCMaD+eLy+KJPGqnCn4s7V1vGofWqxgz5Yvr/fwaKWibuCza1xY/
VveBcRXO17rBbXM8h3OJx8F/samc0kB1OldZeePOu7iNq6h5bJoKkAfoXxVdZAg4A6Zt3Rnh5tTN
fF6JUDPSZjUu8nwc82wG8yVc3axzFgnXfS8OfI/JoiIuBKy4ZD1dr3zijdu9up2rtOIJuJkpsgYv
8NB6FnnK0WDlFS50u3z4Md1cpcCV4VTKOYvEs1A1eqhxWxgSj00FmOYz+XJW+TI0DgNcq4sQutR7
KPOoiKOpFI0O05piMQScs9Bg9MSSdSP9iSfM4LQYXxLVz6+Rk9r2QchjEHrdYFVjEayHrpfQJ3TN
6IqrymZUKx7L6703qavrvUVenzRG3a2EE/IoXtBt7tUlCbiKONpqZbrRWR5ZL+YZ6xFvsUIenRg1
RJwN6bR7ptwJlnn+s2XRqpuiwKPNR9qz2adlCTecmudquIQjVx4P4Vyal3jUP/at1qqqGiuOnXKp
pqFbFh0u+zHOW3vaYalMYpnkrUUNby1KX+k87ksc53GLxWIJL/tMIIjH4nA4CJZcb05dnkeDJF7I
4Ww1fn6N5JQFG4+UtSmeNparcrJaeUwaXX0lz/iKwOsdUJrqgCT5znoC3eboyuO+YzIZJl1XtmVj
G7p2xZXYXBS/38w9LbM4B2neYVVzOJQ0K8IiVL/H4XrKuK4ZLSLzdanE49rb/nG8ZdL/xkP5nD/n
/QNhOKlM+R8AAA==


--=-6Xrx2ynG2mwxVJChb17Z--

