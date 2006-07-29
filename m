From: Hans Reiser <reiser@namesys.com>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed
 by kernelnewbies.org regarding reiser4 inclusion)
Date: Fri, 28 Jul 2006 19:36:07 -0600
Message-ID: <44CABB87.3050509@namesys.com>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl> <44CA31D2.70203@slaphack.com> <Pine.LNX.4.64.0607280859380.4168@g5.osdl.org> <44C9FB93.9040201@namesys.com> <44CA6905.4050002@slaphack.com> <44CA126C.7050403@namesys.com> <44CA8771.1040708@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CA8771.1040708@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Linus Torvalds <torvalds@osdl.org>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, Jeff Garzik <jeff@garzik.org>, Andrew Morton <akpm@osdl.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

David Masover wrote:

>
> If indeed it can be changed easily at all.  I think the burden is on
> you to prove that you can change it to be more generic, rather than
> saying "Well, we could do it later, if people want us to..."

None of the filesystems other than reiser4 have any interest in using
plugins, and this whole argument over how it should be in VFS is
nonsensical because nobody but us has any interest in using the
functionality.  The burden is on the generic code authors to prove that
they will ever ever do anything at all besides complain.  Frankly, I
don't think they will.  I think they will never produce one line of code.

Please cite one ext3 developer who is signed up to implement ext3 using
plugins if they are supported by VFS.

>
>> .  It also prevents users from getting
>> advances they could be getting today, for no reason.
>
>
> It prevents users from doing nothing.

Most users not only cannot patch a kernel, they don't know what a patch
is.  It most certainly does. 

Hans
