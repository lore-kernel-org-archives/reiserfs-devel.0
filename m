From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Tree issues, fsck output
Date: Wed, 30 Jun 2004 12:42:25 +0300
Message-ID: <20040630094225.GN4990@nysv.org>
References: <20040629201956.GK4990@nysv.org> <20040630064547.GL4990@nysv.org> <20040630090322.GM4990@nysv.org> <200406301324.34713.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406301324.34713.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com, sikkh@wp.pl

On Wed, Jun 30, 2004 at 01:24:34PM +0400, Vitaly Fertman wrote:
>it prints all found corruptions. could you send them ?

The thing is, now that 2.6.7-mm4, latest auto-snapshot, failed,
I didn't get any errors with fsck... So it seems my filesystem
is all alright, at least for the time being.

>btw, I hvae already added gauge to the semantic pass. Hopefully will
>release another progs snapshot or internal-snapshot on days.

That would be great!
Any hints on what else to expect beyond the gauge?-)

>if I recall correctly the only corruption was wrong directory entry, right?
>or it fould some more while you were sleeping?

Nope, nada, the last I pasted to you, libmp4, was also the last failure.
Then I think I posted here that xmms wouldn't reinstall and there were
bad ELF headers.

>could you run fsck.reiser4 in check mode again after rebuilding to be sure 
>that evth has been fixed. If you have matadata packed before rebuilding, 
>not after, and you can provide them for downloading, it would be useful.

I'm taking a debugfs.reiser4 -P /dev/hda1 now.
Then I will run additional stuff, but it still seems like the FS is ok....

>> If the semantic tree pass goes cleanly and the fs is consistent, I will
>> try older auto-snapshots, despite the fact that the earlier mm's are
>> not highly recommended.
>to reproduce this we need to know which steps lead to such corruptions.

Yeah, but it ain't easy.
I'd like to hear what changes were made when porting the snapshot
to mainline. If that could possibly induce corruption.

Anyway, I think this part of the discussion is redundant, as the big
problem now remaining is that the 2004.06.29 auto-snapshot doesn't
boot. If it presents these problems, with sibling check and all that
enabled, I will have more details for you.

-- 
mjt

