From: David Masover <ninja@slaphack.com>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Thu, 14 Sep 2006 14:55:57 -0500
Message-ID: <4509B3CD.3010903@slaphack.com>
References: <200609131451.42474.lists@qutek.net> <ee9s4k$f58$1@sea.gmane.org> <200609132110.45703.lists@qutek.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29889-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609132110.45703.lists@qutek.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Quinn Harris <lists@qutek.net>
Cc: reiserfs-list@namesys.com

Quinn Harris wrote:

> The boot optimization was over 3885 files.  Ideally those files would be 
> ordered head to tail in a sequence that perfectly matches the order they will 
> be read.

> I bring this up here because I expect with reiser4, a repacker, and this 

Now that you mention it, do you have a control of some sort to prove 
this isn't just fragmentation?  That is, copy the files you're messing 
with in some random order (that should make booting slower), and 
benchmark that?

I'm guessing a repacker would speed things up much more than this, 
although this is interesting and helpful for systems which need to be 
rebooted often.  (I'd prefer a working suspend2...)
