From: Oleg Drokin <green@namesys.com>
Subject: Re: Question on IICACHE and mount info (2.4.19-pre5)
Date: Mon, 8 Apr 2002 16:59:54 +0400
Message-ID: <20020408165954.A1635@namesys.com>
References: <3CACE903.30901@mb.tu-ilmenau.de> <20020405090248.A6915@namesys.com> <3CB182B0.4030009@mb.tu-ilmenau.de> <20020408160226.A937@namesys.com> <3CB19106.90401@mb.tu-ilmenau.de>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CB19106.90401@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Mon, Apr 08, 2002 at 02:45:58PM +0200, Manuel Krause wrote:

> >Hm, things are not so good here.
> >Too bad you do not have any file-size distribution statistics.
> Is there an easy way to get this info from the filesystems?

Nikita gave you two examples ;)

> >>Yes, I have differences. But I think they're not the ones we wanted to 
> >>see?! I double checked the lines I pasted to this email ;-)
> >I believe right now we have better patches to speed-up things both on read
> >(IDE only) and write that we are testing mostly locally.
> Could you make them available on the namesys server? ;-)

As I said, we are still testing this stuff and do we do not want for someone to
accidentally apply the patches that were not tested enough.
I can send these to you if you want to perform some benchamrks, though.

Bye,
    Oleg
