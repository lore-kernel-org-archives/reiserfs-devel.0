From: Boyd Waters <bwaters+mac@aoc.nrao.edu>
Subject: Re: New server Reiser4 or 3, also Reiser4 on software RAID
Date: Thu, 15 Apr 2004 14:29:58 -0600
Message-ID: <A9F4A120-8F1B-11D8-8778-000A95C88606@aoc.nrao.edu>
References: <3DF9165145FACB4C96977FF650C1E9040C469E0D@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17973-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E9040C469E0D@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

>
> In other words, if I bring the machine down to single user, is there a
> straightforward way that I can upgrade a Reiser3 fs to version 4?

Nope. It's a different system.

You could create a new filesystem, of course, and have it be reiser4, 
mount it, move everything over, and switch.

For a production machine I'm sticking to reiser3 at the moment. But 
testing reiser4 is fine.

~ boyd

Boyd Waters
National Radio Astronomy Observatory
Socorro, New Mexico

