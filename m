From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 01 Sep 2004 01:23:12 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <871xhmlfzz.fsf@uhoreg.ca>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl> <41352279.7020307@slaphack.com>
 <20040901045922.GA512@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>>>>> "Pavel" == Pavel Machek <pavel@ucw.cz> writes:

Pavel> If you only want nice user interface, you can have that
Pavel> today. Its done using coda, and hosted at uservfs.sf.net.

Hmmm.  Last activity seems to be about three years ago.  Any idea if it
works with Linux 2.6?  Is there any chance at all that it will be
merged into the kernel?

Can anyone comment on the speed?  I don't have the ability right now to
try out any new kernel stuff.

The user interface isn't that nice either.  There's no browsability for
the methods.  (Hmm.  I have this strange .deb file.  How do I look at
the contents?  #utar? #ugz? ...)  And honestly, I think that "#" hack
is pretty ugly.  There's also possible name conflicts -- although it's
highly unlikely --  if I have a file that just happens to be called
foo.tar.gz#utar, I can't browse foo.tar.gz.

There may be some nice ideas in there, but from a quick lookover, it
seems to be lacking in execution.  I'll probably give it a try anyways,
during my next round of kernel compiling/testing.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

