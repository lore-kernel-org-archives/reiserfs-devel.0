From: Oleg Drokin <green@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Mon, 19 Aug 2002 09:20:23 +0400
Message-ID: <20020819092023.B1815@namesys.com>
References: <200208152007.42370.degerrit@web.de> <200208152329.40707.degerrit@web.de> <200208161205.00550.vitaly@namesys.com> <200208170254.48383.degerrit@web.de> <m3k7mpreij.fsf@merlin.emma.line.org> <3D5E9D69.1030109@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11224-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D5E9D69.1030109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com, god@namesys.com

Hello!

On Sat, Aug 17, 2002 at 11:00:57PM +0400, Hans Reiser wrote:

> Nikita wrote a badblocks patch.
> The main reason for resisting doing it is that it is usually better to 
> just write to the bad block, and let the hard drive remap the block.
> 
> Oleg, maybe send it into 2.5?

I think I have somewhat better patch and reiserfsck is also prepared for that
(disabled at compile time, though).
The only thing is we had not agreed on unused key to put list of badblocks into
and Chris does not agree that we have store such an info on FS.

I will prepare a patch for 2.5.

Bye,
    Oleg
