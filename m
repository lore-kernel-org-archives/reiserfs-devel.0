From: "Yury Yu. Rupasov" <yura@yura.polnet.botik.ru>
Subject: Re: Comparison of notail and notail,iicache(14) 
 2.4.19-pre7
Date: Fri, 26 Apr 2002 15:41:40 +0400
Sender: root
Message-ID: <3CC93CF4.AEC9C69@yura.polnet.botik.ru>
References: <200204260657.32516.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10183-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?koi8-r?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, ReiserFS List <reiserfs-list@namesys.com>

Dieter N=FCtzel wrote:

> Manuel Krause wrote:
>
> [-]
> > What's really unclear is the problem with my
> > failing Netscape files on the living iicache-mounted FS...
>
> I had one outlier with iicache-new-13 here, too.
>
> /etc/cups/ppds.dat
>
> couldn't be accessed. I reported back but got no response.
>
> > ...and in this line, of course, you're right: The number of applied
> > patches on-here exceeds my limit, too. It's ridiculous. I don't know how
> > much time I'd save if I didn't like to test and configure this own setup
> > to be stable. Mainline? Please, don't comment.
> > My most liked/useful patches are RML.preempt+lock-break,
> > AKPM.read-latency, the recent AA.vm-patches, AA.low-latency and
> > ReiserFS.speedup+pending!
>
> No offenses, please. I truly running much the same, here ;-)))
> Except of ReiserFS.speedup. But the new block allocation is of course
> interesting.
>
> Next thing could be linux-2.4.19p6-compound-speedup.patch.
> Any version for -pre7 ready?
>

This patch should work with linux-2.4.19-pre7 as well.

Thanks,
Yura.

