From: Sander <sander@humilis.net>
Subject: Re: Collect data?
Date: Wed, 23 Nov 2005 16:57:54 +0100
Message-ID: <20051123155754.GB1736@favonius>
References: <200511171447.41362.mail@earthworm.de> <200511231253.37328.mail@earthworm.de> <20051123121751.GC26252@favonius> <200511231321.18455.mail@earthworm.de> <20051123122809.GA31528@favonius> <43846A0C.6010808@namesys.com> <20051123151016.GA7768@favonius> <4384888E.2040407@namesys.com> <20051123153140.GA1736@favonius> <43848FB1.4050001@namesys.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27115-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43848FB1.4050001@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: sander@humilis.net, "Hesse, Christian" <mail@earthworm.de>, reiserfs-list@namesys.com, "E.Gryaznova" <grev@namesys.com>

Vladimir V. Saveliev wrote (ao):
> Sander wrote:
> > Vladimir V. Saveliev wrote (ao):
> >>No. This is not a fix. This is a patch which I suspect is responsible for sync
> >>performance drop. It fixes old reiser4 bug known as "not updating atime".
> >>I asked you to reverse this patch to check whether this patch caused recent sync
> >> performance degradation.
> > 
> > Ah!
> > 
> > Now, if I remount my Reiser4 filesystem noatime,nodiratime, the problem
> > is gone.
> > 
> > Does that help?
> > 
> > Do you still want me to test a kernel with your patch?
> 
> Probably not, but
> there were recently several reports about reiser4 sync performance degradation.
> It would be great to hear that mounting noatime or unapplying that patch fixes
> all problmes, including the one with evolution's field resizing and vim's ":wq".

Well, for me the mount noatime fixes it for sure :-)

Weird thing though, my other system also has the default mounts (no
noatime or nodiratime) and doesn't suffer from the slowdown.

Also, I don't have Evolution, but the difference in vim (and thus mutt,
and btw, Postfix too) is _huge_.

-- 
Humilis IT Services and Solutions
http://www.humilis.net
