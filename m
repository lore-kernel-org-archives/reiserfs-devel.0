From: Oleg Drokin <green@namesys.com>
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: Fri, 28 Feb 2003 10:46:51 +0300
Message-ID: <20030228104651.A1234@namesys.com>
References: <20030220175309.A23616@namesys.com> <b3mnpd$1ho$1@satsuki.furryterror.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <b3mnpd$1ho$1@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Feb 27, 2003 at 11:15:41PM -0500, Zygo Blaxell wrote:

> OK, I did the following:
> 	patch kernel
> 	install patched kernel
> 	umount filesystem
> 	reiserfsck 3.6.5-pre1 --fix-fixable the filesystem
> 	forgot to note the last few things reiserfsck said

Ideally, resiserfsck should have told you wwhenever there were any
unfixed corruptions left.

> 	reboot machine
> 	verify that patched kernel is running
> 	wait a few days
> 	read "unlink: Permission denied" in logs
> I'm wondering if I'm still seeing the bug, or just the lingering
> after-effects of the bug that might still be hiding in the filesystem.

Hard to tell. But it well might be a hiding bugs.
--fix-fixable does not correct link counts, so if you have
file with nlinks=3 and 4 hardlinks to it, you are in trouble after
three of the hardlinks are removed.

> Is fix-fixable able to correct link counts?  If not, presumably I need

No. It may only delete entries pointing to nowhere, I think.

> to do a full rebuild-tree in order to correct any incorrect link counts
> that may still be present on the filesystem?

Probably yes.

Bye,
    Oleg
