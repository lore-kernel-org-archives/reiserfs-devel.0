From: Chris Mason <mason@suse.com>
Subject: Re: Some kind of benchmark
Date: Wed, 02 Jun 2004 09:16:16 -0400
Message-ID: <1086182176.22636.3449.camel@watt.suse.com>
References: <200406011832.30163.marcel@hilzinger.hu>
	 <1086168950.24589.4.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1086168950.24589.4.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Marcel Hilzinger <marcel@hilzinger.hu>, reiserfs-list@namesys.com

On Wed, 2004-06-02 at 05:35, Vladimir Saveliev wrote:

> Suse kernel differs from stock one substantially. I guess. So, it is
> very likely that those changes (which are not reiserfs only, certainly)
> are responsible for that difference.
> When suse experts will wake up they will say more details about what
> might cause overwrite speedup

Well, the suse kernel has a lot of patches that are supposed to make
things faster.  Try benchmarking against 2.6.6 or 2.6.7-rc1, which has
most of them included.

-chris


