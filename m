From: Oleg Drokin <green@namesys.com>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Wed, 9 Oct 2002 09:42:15 +0400
Message-ID: <20021009094215.B11954@namesys.com>
References: <Pine.LNX.4.44.0210082331110.10033-100000@fii.fi.tartu.ee>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11623-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0210082331110.10033-100000@fii.fi.tartu.ee>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Tiismus <robert@fi.tartu.ee>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Oct 08, 2002 at 11:55:42PM +0300, Robert Tiismus wrote:
> malfunction with the new hardware. I think that when closing the side
> panel, I misaligned the scsi cable from the connector and disk access
> malfunctioned. Then, after rebooting the system, everything seemed ok, besides
> this unfortunate inident with three mailboxes :(

Behaviour of hardware is unpredicatble on bad wiring and that kind of stuff.

> Is it possible, that VBT happened during following reboot?

If the wiring was already ok, then this is very unlikely.

Also you probably want to run reiserfsck on that disk to make sure
no other damage happened.

Bye,
    Oleg
