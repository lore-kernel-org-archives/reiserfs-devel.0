From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 5 Sep 2004 13:57:49 +0200
Message-ID: <1215700165.20040905135749@tnonline.net>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl>
 <Pine.LNX.4.58.0408311252150.2295@ppc970.osdl.org>
 <m3eklm9ain.fsf@zoo.weinigel.se> <20040905111743.GC26560@thundrix.ch>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-21479-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040905111743.GC26560@thundrix.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tonnerre <tonnerre@thundrix.ch>
Cc: Christer Weinigel <christer@weinigel.se>, Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Pavel Machek <pavel@ucw.cz>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


  

> Salut,

> On Wed, Sep 01, 2004 at 01:02:24AM +0200, Christer Weinigel wrote:
>> I can see the argument for having the equivalent of Content-type or
>> Content-transfer-encoding as a named stream though.

> Why having them as  named streams if we can get them  as xattrs for no
> additional pain? (Since fileutils would  have to be changed anyway, we
> can even make cp copy and emacs update xattrs.)

  What if I do not use emacs, but vim, mcedit, gedit, or some other
  editor? It doesn't seem logical to have to patch every application
  that uses files.

  ~S

> 			    Tonnerre

