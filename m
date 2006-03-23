From: Jindrich Makovicka <makovick@kmlinux.fjfi.cvut.cz>
Subject: Re: 2.6.16-rc6-mm2: slow writes on reiser4.
Date: Thu, 23 Mar 2006 19:44:56 +0100
Message-ID: <4422ECA8.6000309@kmlinux.fjfi.cvut.cz>
References: <44206D3C.7050504@free.fr> <4420FFA2.1090908@namesys.com> <44219CC2.3060405@free.fr> <44219FA8.2050606@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28327-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44219FA8.2050606@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Laurent Riffard <laurent.riffard@free.fr>, reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>, Alexander Zarochentcev <zam@namesys.com>

Hans Reiser wrote:
> Instead of using sync, could you increase the size of the files you
> write so that they are 10x ram size?
> 
> I have a suspicion we are slow at sync....  I am not sure why, but I
> have seen other data where sync was slow for us, and maybe we need to
> optimize that code path.

My impression is rather that the bottleneck is the amount of seeking the
sync causes - would it be possible to reorder the write operations
somehow, still preserving atomicity?

Also, a comparison of Reiser4 performance on NCQ vs. non-NCQ drive could
be interesting (I don't have NCQ, maybe that's the problem).

Regards,
-- 
Jindrich Makovicka
