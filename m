From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: reiserfs b0rken on 2.4.22-pre4-ben0 on powerpc ?
Date: 13 Jul 2003 14:43:22 +0200
Message-ID: <1058100202.923.16.camel@localhost>
References: <1058010165.17888.8.camel@localhost>
	 <1058038447.13317.102.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14918-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1058038447.13317.102.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

On Sat, 2003-07-12 at 21:34, Chris Mason wrote:
> On Sat, 2003-07-12 at 07:42, Soeren Sonnenburg wrote:
> > Hi.
> > 
> > I tried to mount a reiserfs partition (which is connected via firewire
> > or usb mass storage) and while it mounts ok with 2.4.21-ben2 it hangs
> > while mounting on 2.4.22-pre4-ben0.
> > 
> > I guess something is broken there... I can get into the kernel debugger
> > xmon and supply you with a backtrace shot taken with some digital
> > camera... if that helps.
> 
> Please try this (which is in -pre5 and not related to reiserfs)

You are right that patch fixes it.

Pretty strange that it worked on some ext3 partition ... hmmhh.

Thanks a lot,
Soeren.

