From: Oleg Drokin <green@namesys.com>
Subject: Re: Question on IICACHE and mount info (2.4.19-pre5)
Date: Fri, 5 Apr 2002 17:37:17 +0400
Message-ID: <20020405173717.A1635@namesys.com>
References: <3CACE903.30901@mb.tu-ilmenau.de> <20020405090248.A6915@namesys.com> <3CADA627.7080800@mb.tu-ilmenau.de>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CADA627.7080800@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: "Yury Yu. Rupasov" <yura@yura.polnet.botik.ru>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Fri, Apr 05, 2002 at 03:27:03PM +0200, Manuel Krause wrote:
> >>Seems like some things have gone with the latest patches which worked 
> >>before? It's o.k., of course, if "iicache" doesn't show up for now, I 
> >>know it's for testing only (yes, it would be very nice!). But the 
> >>"notail" thing worked before!
> >Which "notail" thing?
> Mmmh. I only repeated myself? I wanted to say that the "notail" mount 
> option showed up in "# cat /proc/mounts" some weeks ago, IIRC.

Actually function to implement correct /proc/mounts output
for reiserfs never was implemented, though I think I will return to it.
But right now there are more important stuff to do.

Bye,
    Oleg
