From: Oleg Drokin <green@namesys.com>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 17:57:13 +0400
Message-ID: <20030331175713.A9187@namesys.com>
References: <20030331113446.A31858@namesys.com> <20030331074957.GD22731@cherenkov.orbis-terrarum.net> <20030331120014.C25533@namesys.com> <20030331083758.GA23518@cherenkov.orbis-terrarum.net> <20030331125652.H25533@namesys.com> <20030331091621.GA23666@cherenkov.orbis-terrarum.net> <20030331132454.L25533@namesys.com> <20030331101714.GA23949@cherenkov.orbis-terrarum.net> <20030331143623.R25533@namesys.com> <20030331111332.GC23949@cherenkov.orbis-terrarum.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13486-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331111332.GC23949@cherenkov.orbis-terrarum.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Mar 31, 2003 at 03:13:32AM -0800, Robin H. Johnson wrote:

> At the present rate, it looks like it will be at least 50% compression,
> I'm thinking more since the drive was about 60% full.

Ok, so we have found that your filesystem have relocated journal
enabled for some reason.
"reiserfstune --make-journal-standard /dev/hdb1" should make the partition mountable.
Another question is how did you got it to this state. We are failing to see it yet.
Do you have any idea?
BTW we are still interested in copy of your filesystem.

Bye,
    Oleg
