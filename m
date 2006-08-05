From: David Masover <ninja@slaphack.com>
Subject: Re: Another article abour Reiser4 on linux.com
Date: Sat, 05 Aug 2006 17:40:12 -0400
Message-ID: <44D5103C.2030201@slaphack.com>
References: <87bqqzbaug.fsf@baldur.nicundtas.de>	<44D4B154.6010005@slaphack.com> <28295017.20060805181722@wp.pl>	<1254266559.20060805182204@wp.pl> <20060805180722.GN17805@HAL_5000D.tc.ph.cox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060805180722.GN17805@HAL_5000D.tc.ph.cox.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Clay Barnes <clay.barnes@gmail.com>
Cc: =?UTF-8?B?TWFjaWVqIFNvxYJ0eXNpYWs=?= <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

Clay Barnes wrote:
> I like using a term that is already in an accepted part of the
> kernel.  Extensions might smack of plugins a bit much, and we're
> trying to avoid just doing a s/plugins/extensions/ of the
> arguments we're seeing now.

We could do that with almost anything:

>> Or just modules... netfilter has modules that allow us to write
>> very cool and weird stuff (like unclean match once was) and
>> nobody complains.

Except that modules could also possibly remind people of proprietary 
modules, like the nvidia/ATI/vmware stuff.

Still, if we allow netfilter, why not Reiser4 modules?

>> Another word could be 'hooks'

I don't think this would quite work.  A hook describes more the place 
you connect to, whereas a module/plugin/whatever...

Think of it this way -- the hook is what a plugin would plug in to.

So it may not matter much what we name them, we're probably still going 
to need that cut'n'paste argument.  Might be easier with "modules", though.

