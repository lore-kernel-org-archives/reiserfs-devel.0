From: Marc-Christian Petersen <m.c.p@gmx.net>
Subject: Re: power loss -> corruption
Date: Thu, 8 May 2003 14:38:33 +0200
Message-ID: <200305081437.25656.m.c.p@gmx.net>
References: <93F527C91A6ED411AFE10050040665D007AA853B@corpusmx1.us.dg.com> <m1bryd1uve.fsf@orchid.mirar.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14010-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m1bryd1uve.fsf@orchid.mirar.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mirar <mirar-yg@mirar.org>, berthiaume_wayne@emc.com
Cc: Dieter.Nuetzel@hamburg.de, reiserfs-list@namesys.com

On Thursday 08 May 2003 14:32, Mirar wrote:

Hi Mirar,

> berthiaume_wayne@emc.com writes:
> > 	"data=journal" will also work. You'll need to use the data logging
> > patches that Chris Mason has put together.
>
> Thanks.
>
> I assume it's the ones I found here?
> ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20
>
> Do I need all of them or just 03-data-logging?
>
> Any reason why they haven't entered the official 2.4.21 (or have they)?
2.4.21 isn't released yet. It's in -rc1 stage and there are still tons of 
outstanding bugs which have to be fixed (I am afraid they won't).

However, there are 2.4.21-rc1 patches. See:
ftp://namesys.com/pub/reiserfs-for-2.4/testing/data-logging-and-quota-2.4.21-rc1

--
ciao, Marc


