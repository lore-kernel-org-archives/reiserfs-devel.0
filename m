From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: "Metas"
Date: Fri, 23 Apr 2004 23:35:15 +0300
Message-ID: <20040423203515.GK19049@nysv.org>
References: <40869EAD.9020806@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18184-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40869EAD.9020806@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hans Reiser wrote:

>so if rename works on metas, are you guys happy?

With all due respect:
You must be shitting me...

Lookups would be next to impossible, for one. And what if someone actually
loses a meta directory, like, renames it accidentally and forgets about it?
Yeah, far-fetched but stuff does happen...

What's so terribly bad about having the name for it in /proc or /sys
or wherever and having it global from the kernel config?

This is such a waste of time, really.

-- 
mjt

