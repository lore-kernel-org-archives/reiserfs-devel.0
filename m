From: Pavel Machek <pavel@ucw.cz>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Sun, 6 Aug 2006 22:59:12 +0000
Message-ID: <20060806225912.GC4205@ucw.cz>
References: <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl> <44CF87E6.1050004@slaphack.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750756AbWHFW7l@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <44CF87E6.1050004@slaphack.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, Bernd Schubert <bernd-schubert@gmx.de>, reiserfs-list@namesys.com, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Clay Barnes <clay.barnes@gmail.com>, Rudy Zijlstra <rudy@edsons.demon.nl>, Adrian Ulrich <reiser4@blinkenlights.ch>, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

On Tue 01-08-06 11:57:10, David Masover wrote:
> Horst H. von Brand wrote:
> >Bernd Schubert <bernd-schubert@gmx.de> wrote:
> 
> >>While filesystem speed is nice, it also would be great 
> >>if reiser4.x would be very robust against any kind of 
> >>hardware failures.
> >
> >Can't have both.
> 
> Why not?  I mean, other than TANSTAAFL, is there a 
> technical reason for them being mutually exclusive?  I 
> suspect it's more "we haven't found a way yet..."

What does the acronym mean?

Yes, I'm afraid redundancy/checksums kill write speed, and you need
that for robustness...

You could have filesystem that can be tuned for reliability and tuned
for speed... but you can't have both in one filesystem instance.
-- 
Thanks for all the (sleeping) penguins.
