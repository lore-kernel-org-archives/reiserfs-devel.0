From: Oleg Drokin <green@namesys.com>
Subject: Re: 2.4.21 reiserfs oops
Date: Mon, 23 Jun 2003 13:53:56 +0400
Message-ID: <20030623095356.GA12936@namesys.com>
References: <87he6iyzyj.fsf@amaterasu.srvr.nix>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14669-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87he6iyzyj.fsf@amaterasu.srvr.nix>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nix <nix@esperi.demon.co.uk>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

Hello!

On Sun, Jun 22, 2003 at 03:00:20PM +0100, Nix wrote:

> Jun 22 13:52:42 loki kernel: Unable to handle kernel NULL pointer dereference at virtual address 00000001 

This is very strange address to oops on.

> Jun 22 13:52:43 loki kernel: EIP:    0010:[<c0092df4>]    Not tainted 

And the EIP is prior to kernel start which is also very strange.
On the other hand the address c0192df4 is somewhere inside reiserfs code,
so it looks like a single bit error, I'd say.

Can you run memtest86 for some time to verify that your RAM is OK?
(hm, and the oops got twice to the logs which is pretty strange thing, too,
never seen anything like this).

Bye,
    Oleg
