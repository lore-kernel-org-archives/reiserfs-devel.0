From: Claudio Martins <ctpm@rnl.ist.utl.pt>
Subject: Re: Terrible performance (<100kb/sec) in a cp -Raf
Date: Fri, 18 Jun 2004 14:43:23 +0100
Message-ID: <200406181443.23648.ctpm@rnl.ist.utl.pt>
References: <oyd4qpee0fv.fsf@bert.cs.rice.edu> <59191.194.25.40.4.1087554202.squirrel@mailrapid.upb.de> <20040618132747.GA23705@hvs.envisage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040618132747.GA23705@hvs.envisage.co.za>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hendrik Visage <hvisage@envisage.co.za>
Cc: reiserfs-list@namesys.com

On Friday 18 June 2004 14:27, Hendrik Visage wrote:
> On Fri, Jun 18, 2004 at 12:23:22PM +0200, godot@uni-paderborn.de wrote:
> > >> Uh, I wonder why I read "firewire" when it was "USB" ;)
> > >
> > > And then also, USB 1.1 would only run at about 100Kbyte/sec max :(
> >
> > That should read ~1000 KB/s.
>
> USB 1.1 is 1.2Mbit/sec (give or take a few bits ;^) = ~150Kbyte/sec


  No.

  USB 1.1 is 12Mb/s max transfer speed. HID (mice, keyboard) devices use a low 
rate transfer mode of 1.2Mbit/sec, but USB Storage devices like external 
disks and dvd burners use up to 12Mbit/s, which gives a little above 1Mbyte/s 
transfer rate to/from a reiserfs filesystem on that external device.

  Newer USB 2.0 capable hardware can give 480Mbit/sec.

regards

Claudio

