From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 20:26:21 +0100
Message-ID: <20041230192621.GB25669@merlin.emma.line.org>
References: <3DF9165145FACB4C96977FF650C1E90411F73702@its-mail1.its.corp.gwl.com> <87hdm3ocou.fsf@quasar.esben-stien.name>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22974-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87hdm3ocou.fsf@quasar.esben-stien.name>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, 30 Dec 2004, Esben Stien wrote:

> Sure, but your not factoring in murphys law here. A tool to undelete
> would come many people in handy who even got proper backup solutions.

You're asking for a versioned file system. If reiserfs v4 doesn't offer
such properties, find something else that does.

> Besides, a recovery is not the same as a feature to undelete. Such a
> feature would maybe save a days work, which is a lot in some circles.

Backup more often. Staged backup schemes (hourly, daily, weekly,
monthly) with varying levels of differential or complete backups, plus
off-site archives, are probably a good idea for these circles then.

-- 
Matthias Andree
