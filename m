From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 1 Sep 2004 01:20:58 +0200
Message-ID: <875639874.20040901012058@tnonline.net>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl>
 <Pine.LNX.4.58.0408311252150.2295@ppc970.osdl.org>
 <m3eklm9ain.fsf@zoo.weinigel.se>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21190-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3eklm9ain.fsf@zoo.weinigel.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christer Weinigel <christer@weinigel.se>
Cc: Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Pavel Machek <pavel@ucw.cz>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


  

> Linus Torvalds <torvalds@osdl.org> writes:

>> In a graphical environment, the "icon" stream is a good example of this.
>> It literally has _nothing_ to do with the data in the main stream. The
>> only linkage is a totally non-technical one, where the user wanted to
>> associate a secondary stream with the main stream _without_ altering the
>> main one. THAT is where named streams make sense.

> I think that the "icon" argument for named streams is a silly
> argument, since different users may want to have different icons for
> the same file.  Say that I want /usr/bin/emacs to have the enterprise
> icon and someone else wants the gnu head icon.  And besides, root owns
> the file anyways, so neither of us mortal users should be able to add
> a stream to it.

  Yet again are we thinking in blocking ways. Firstly this was an
  example. Usually, though, most users accept the default icon for a
  file. If they do not they can still change the icon for the link
  they make on their start-menu/home folder/etc.

> Another reason for named streams that usually crops up is the ability
> set a "preferred application" for a certain file, so that when I
> double click on a document I want to open it with antiword instead of
> openoffice.  But the same contra-argument applies here, different
> users have different preferences.

  I can make the same argument as for the icons.

> I can see the argument for having the equivalent of Content-type or
> Content-transfer-encoding as a named stream though.

  That would be a nice thing.

>   /Christer


