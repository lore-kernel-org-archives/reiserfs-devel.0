From: Ookhoi <ookhoi@humilis.net>
Subject: Re: reiserfs for old system?
Date: Tue, 6 May 2003 16:49:59 +0200
Message-ID: <20030506164959.F2196@humilis>
References: <Pine.GSO.4.53.0305061320040.10901@pitsa.pld.ttu.ee>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.53.0305061320040.10901@pitsa.pld.ttu.ee>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Siim Vahtre <siim@pld.ttu.ee>
Cc: reiserfs-list@namesys.com

Siim Vahtre wrote (ao):
> I have an old laptop (486/sx, 33mhz, 8M RAM) with ~180M hd.
> 
> I really don't care much about the stability, although I would love to
> make it a bit faster. Currently is uses e2fs but would have no problem
> converting it to reiserfs if I gain some speed by doing that.

Reiserfs puts a higher load on the cpu than ext2. In your case, I think
reiserfs would be slower than ext2.
