From: Chris Mason <mason@suse.com>
Subject: Re: 2.4.21 reiserfs oops
Date: 24 Jun 2003 17:09:26 -0400
Message-ID: <1056488965.10097.60.camel@tiny.suse.com>
References: <87he6iyzyj.fsf@amaterasu.srvr.nix>
	 <20030623095356.GA12936@namesys.com> <87k7bcxww4.fsf@amaterasu.srvr.nix>
	 <20030624053129.GA24025@namesys.com>  <8765mvxlhs.fsf@amaterasu.srvr.nix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <8765mvxlhs.fsf@amaterasu.srvr.nix>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nix <nix@esperi.demon.co.uk>
Cc: Oleg Drokin <green@namesys.com>, Linux Kernel Development <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

On Tue, 2003-06-24 at 16:34, Nix wrote:
> On Tue, 24 Jun 2003, Oleg Drokin moaned:
> > Hello!
> > 
> > On Mon, Jun 23, 2003 at 11:16:27PM +0100, Nix wrote:
> > 
> >> >> Jun 22 13:52:42 loki kernel: Unable to handle kernel NULL pointer dereference at virtual address 00000001 
> >> > This is very strange address to oops on.
> >> I'll say! Looks almost like it JMPed to a null pointer or something.
> > 
> > No, if it'd jumped to a NULL pointer, we'd see 0 in EIP.
> 
> JMPed to ((long)NULL)+1 or something then :) the fact remains that it's
> not somewhere that even a memory error would make us likely to jump to.
> 
> >> >> Jun 22 13:52:43 loki kernel: EIP:    0010:[<c0092df4>]    Not tainted 

The EIP isn't zero or 1, you've got a bad null pinter dereference at
address 1.  You get this when you do something like *(char *)1 =
some_val.

The ram is most likely bad, you're 1 bit away from zero, but you might
try a reiserfsck on any drives affected by the scsi errors.

-chris


