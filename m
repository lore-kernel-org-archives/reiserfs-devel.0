From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: corrupted 3.5 format fs
Date: Thu, 22 Aug 2002 15:55:25 +0400
Message-ID: <200208221555.25020.vitaly@namesys.com>
References: <20020822063512.54daaeaf.philippe.gramoulle@mmania.com> <20020822094356.A1660@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11289-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020822094356.A1660@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: reiserfs <reiserfs-list@namesys.com>

On Thursday 22 August 2002 09:43, Oleg Drokin wrote:
> Hello!
>
> On Thu, Aug 22, 2002 at 06:35:12AM +0200, Philippe Gramoull? wrote:
> > So , i did and re-ran --check and came with still 1 corruption left that
> > was said to be able to be corrected with --fix-fixable.
> > Re-ran --fix-fixable and --check , and i still had this '1 corruption
> > found which can be fixed with --fix-fixable'
> > bad_stat_data: block 38372, [3955 5371 0x0 SD (0)], SD has bad nlink
> > number

Yes, the idea to fix nlinks on fix-fixable has some problems and we decided
to leave it for rebuild-tree as it was before.

-- 

Thanks,
Vitaly Fertman
