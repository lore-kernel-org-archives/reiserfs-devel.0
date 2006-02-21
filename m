From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 bug in 2.6.16-rc2-mm1
Date: Tue, 21 Feb 2006 17:57:27 +0300
Message-ID: <1140533847.12162.28.camel@tribesman.namesys.com>
References: <20060210142215.GA1714@deprez-aerts.dyndns.org>
	 <200602162317.32054.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
	 <fdc23ba20602170843u333d1328kbd658812692a3ea3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <fdc23ba20602170843u333d1328kbd658812692a3ea3@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Cohorn <elotemuygrande@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2006-02-17 at 10:43 -0600, John Cohorn wrote:
> Is there a known issue with 2.6.16-xxx-mm1? I too am having severe and
> very random, but reproducible problems which will completely lock up
> my machine minutes after mounting an R4 partition if not seconds. I
> did try disabling 4K stacks in my .config. Also, this is an Athlon 64
> X2 I'm running with so maybe there are SMP issues? 

no, it does not look so.

> One of my friends said that Reiser4 became unstable for him also when
> he upgraded to a dual core Athlon64...but until I test for myself
> that's just a wild theory that it's an SMP bug. This machine is
> otherwise stable in Memtest, in Windows playing the latest games, and
> on Linux compiling huge amounts of software.
> 
> If there are not known issues with the latest kernels then I will
> happily try to send detailed configurations and logs of what's
> happening this evening. I have two shiny new 250GB SATA drives on my
> machine and I can test freely with one of them until I need the space.
> I'd love to help squash any bugs that I can :)
> 

If you described the exact sequence of commands which makes reiser4 to
crash - that would help a lot.


