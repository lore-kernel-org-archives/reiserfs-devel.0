From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Reiser4's status of this week.
Date: Sun, 20 Jun 2004 01:08:31 +0300
Message-ID: <20040619220830.GK4990@nysv.org>
References: <7794555.1087651158684.JavaMail.postfix@mx20.mail.sohu.com> <40D45B6C.7000002@namesys.com> <40D482CB.1080303@netscape.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19273-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40D482CB.1080303@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas S. Wourms" <nwourms@netscape.net>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Sat, Jun 19, 2004 at 02:15:39PM -0400, Nicholas S. Wourms wrote:
>
>I've also noticed, as has been noted in the past, that bk pulls are 
>still broken.  Someone mentioned that it is a problem with the new bk. 
>If this is true, why not contact Larry for support?  Not that it matters 
>now, since the reiser4-linux-2.6 isn't usable, but it might be helpful 
>for future syncs.

The new 2.6s are very usable.

Last I spoke with Zam Zarochentsev he said he had a theory for fixing
the biggest bug that has to do with mmap applications when running out
of memory.

Besides that, I haven't heard of any mission-critical bugs.

As for BK, I don't care, as we have the auto-snapshots at the URL
http://namesys.com/auto-snapshots available.

Mind you, some older 2.6 auto-snapshots were best described by the
word unusable, but it's gotten better.

-- 
mjt

