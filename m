From: Oleg Drokin <green@namesys.com>
Subject: Re: Is it good for a PDA fs?
Date: Sun, 23 Jun 2002 11:45:36 +0400
Message-ID: <20020623114536.A1003@namesys.com>
References: <20020622115207.E23457@gerf.org> <20020622175746.I13075@parcelfarce.linux.theplanet.co.uk> <3D14B8E9.4020808@namesys.com> <20020622230748.A1981@namesys.com> <3D14E47E.5080300@namesys.com> <20020623105057.A5090@namesys.com> <3D15762A.3000507@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10802-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3D15762A.3000507@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Dukes <pakrat@www.uk.linux.org>, The Doctor What <docwhat@gerf.org>, reiserfs-list@namesys.com

Hello!

On Sun, Jun 23, 2002 at 11:18:02AM +0400, Hans Reiser wrote:

> >>I think I probably care more about downloading and trying the latest 
> >>kalendar than installing a new kernel on it.;-)   It is nice to have ssh 
> >Yes, exactly. I do not see how you (or any other user) would benefit from
> >using anything but vfat in CF, but disadvantages are pretty clear.
> Space would be saved if the journal was shrunk in size....

VFAT (fat32) addresses 512 byte blocks while reiserfs now addresses
4096 byte blocks. (not this can be theoretically decreased to 1024 byte blocks
with a patch, but in this case tree will grow very quickly and will reach
height of 5 way too soon). And while on reiserfs tails are not packed
for files over 16K (and not packed for smaller files in some cases to to avoid
"seeks"), it is impossible to spend more than 511 bytes of unused space
on vfat no matter what file size is. (vs max of 4095 bytes wasted on
reiserfs in unlucky case).
So right now I do not see noticeable space savings.
Of course I have not performed precise measurements so this is only
a theory.

Bye,
    Oleg
