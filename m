From: Hans Reiser <reiser@namesys.com>
Subject: Re: short term task list for Reiser4
Date: Tue, 11 Jul 2006 17:06:34 -0700
Message-ID: <44B43D0A.8010803@namesys.com>
References: <44B42064.4070802@namesys.com>	<20060711222903.GG9220@HAL_5000D.tc.ph.cox.net>	<44B43019.9010402@namesys.com> <20060711235553.GH9220@HAL_5000D.tc.ph.cox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28961-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060711235553.GH9220@HAL_5000D.tc.ph.cox.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clay Barnes <clay.barnes@gmail.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>, LKML <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>

Reiser4 generally could use some knobs controlling things like whether
we trickle data slowly and continuously

>
>If you have a lazy write policy, what exactly is gained by intentionally
>delaying writes (beyond a certain size that is necessary to make things
>like dancing trees actually effecient)?  If you trickle some data to
>disk, then when memory pressure causes (or an app calls) a big sync,
>then you have less to actually write.  What I'm suggesting, now, is not
>a major write policy change, but rather a light process that is limited
>to extremely low resource use (I/O, CPU, etc.).  It would take some of
>the edge off of major syncs, and for many (most?) non-server users, it
>could wholly eliminate memory pressure-induced heavy syncs.
>
>--Clay
>
>
>  
>

