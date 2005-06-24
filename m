From: Jim Crilly <jim@why.dont.jablowme.net>
Subject: Re: reiser4 plugins
Date: Thu, 23 Jun 2005 21:19:28 -0400
Message-ID: <20050624011928.GO21897@mail>
References: <42BAC304.2060802@slaphack.com> <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl> <20050623221222.33074838.reiser4@blinkenlights.ch> <3aa654a405062314296a4ca2ae@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24527-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3aa654a405062314296a4ca2ae@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avuton Olrich <avuton@gmail.com>
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>, Horst von Brand <vonbrand@inf.utfsm.cl>, ninja@slaphack.com, reiser@namesys.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On 06/23/05 02:29:21PM -0700, Avuton Olrich wrote:
> On 6/23/05, Adrian Ulrich <reiser4@blinkenlights.ch> wrote:
> > From my POV:
> >  I've been using Reiser4 for almost everything (Rootfs / External
> >  Harddrives) for about ~8 Months without any data loss..
> > 
> >  Powerloss, unpluging the Disk while writing, full filesystem,
> >  heavy use : No problems with reiser4.. It *is* stable.
> 
> *From users who use it* I have heard nothing but love for reiser4.
> It's amazing how quickly people seem to be dismissive about what
> reiser4 has to offer when they more than likely haven't taken it for a
> spin at all. All I hear about is 'we can't let something ugly go into
> the stable kernel' then in the same day I looked into some of the
> config options...
> 
> CONFIG_WDC_ALI15X3:
> *snip*
> This allows for UltraDMA support for WDC drives that ignore CRC
> checking. You are a fool for enabling this option, but there have been
> requests.
> *snip*

That's hardly a good example, that config option, while obviously
questionable, only added 2 #ifdef blocks and affects 1 function that's 20
lines long.

> 
> How many have requested that reiser4 make it into the kernel? I'd
> imagine many more then requested this IDE feature. And it's an
> *option*. Please work something out on this.
> 
> avuton

Jim.
