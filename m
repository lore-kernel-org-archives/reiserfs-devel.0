From: Oleg Drokin <green@namesys.com>
Subject: Re: slow mount
Date: Thu, 12 Jun 2003 21:26:24 +0400
Message-ID: <20030612172624.GG7319@namesys.com>
References: <1055427629.1875.8.camel@terminus.zapto.org> <20030612144609.GA27645@namesys.com> <1055432836.8601.3.camel@terminus.zapto.org> <3EE8A2A0.2080500@namesys.com> <1055435090.2028.7.camel@terminus.zapto.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14526-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1055435090.2028.7.camel@terminus.zapto.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbie Hopkins <Herbie@Hopkins.net>
Cc: Hans Reiser <reiser@namesys.com>, Reiserfs <reiserfs-list@namesys.com>

Hello!

On Thu, Jun 12, 2003 at 05:24:50PM +0100, Herbie Hopkins wrote:
> > Is the hardware starting to fail and doing lots of retries maybe?
> I sure hope not as the drive is only a couple of months old. Booting a
> kernel with CONFIG_REISERFS_CHECK=y dmesg gives me:
> reiserfs:warning: CONFIG_REISERFS_CHECK is set ON
> reiserfs:warning: - it is slow mode for debugging.
> reiserfs: checking transaction log (device 03:07) ...
> journal-1153: found in header: first_unflushed_offset 465,
> last_flushed_trans_id 84176
> journal-1206: Starting replay from offset 465, trans_id 84177
> journal-1299: Setting newest_mount_id to 95
> Using r5 hash to sort names
> ReiserFS version 3.6.25
> which looks normal to me.

What if you turn off this debugging stuff that is certainly slows down all the operations by a lot?
Corresponding kernel option (compile-time) is CONFIG_REISERFS_CHECK

Bye,
    Oleg
