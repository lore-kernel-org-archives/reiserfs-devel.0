From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 01:10:14 -0700
Message-ID: <412EEC66.2070508@namesys.com>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408261315110.2304@ppc970.osdl.org> <412E69D2.50503@namesys.com> <Pine.LNX.4.58.0408261625180.2304@ppc970.osdl.org> <412E769B.1090508@namesys.com> <20040827020350.GF21964@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20888-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040827020350.GF21964@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Linus Torvalds <torvalds@osdl.org>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

viro@parcelfarce.linux.theplanet.co.uk wrote:

>On Thu, Aug 26, 2004 at 04:47:39PM -0700, Hans Reiser wrote:
>
>  
>
>>Sometimes you want the nonlocal effects and sometimes you don't, and by 
>>decomposing streams into smaller primitives we can let users choose as 
>>they want.
>>    
>>
>
>Right.  Now, would you kindly post the detailed technical analysis of your
>wonderful design that handles that stuff safely?  With proof of correctness,
>please.  Since we are expected to take your code and use it as "Uber"
>replacement for the existing one, it surely would not be too much to expect,
>would it?
>
>And no, "we have a nice presentation somewhere on namesys" does not
>qualify.
>
>I apologize for the obvious posting in a thread already full of noise,
>but I would like to make *very* sure that lack of ripping you another
>one does *not* mutate into "no objections from viro" in a lovely thread
>on SlashDot in a week or so.
>
>
>  
>
Over the next 6-18 months, one piece at a time, it will all fall into 
place. 

Reiser4 as it is shipping today, consists of close to the minimal 
functionality necessary to replace reiser3, albeit done according to our 
plugin model, and with vastly higher performance.  The full solution is 
not yet written, wait for it.  I understand why you think deadlocks are 
everything, but avoiding them is only a small, albeit necessary, piece 
of the task.

Thanks though for pointing out issues with unlinking files that have 
been cd'd to.
