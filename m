From: Oleg Drokin <green@namesys.com>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Wed, 8 May 2002 09:30:44 +0400
Message-ID: <20020508093044.A32071@namesys.com>
References: <3CD72AB1.6010607@netscape.net> <20020507092207.A6678@namesys.com> <3CD82C76.2080706@netscape.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10282-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CD82C76.2080706@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuelkrause@netscape.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Gwllo!

On Tue, May 07, 2002 at 09:35:18PM +0200, Manuel Krause wrote:

> >Sure. Files are deleted already. How do you plan to retrieve deleted files?
> >(not using backups, that's it).
> Mmh. I meant to restore the affected files from existing backups. When

Then you just see what files are missing and restore these.

> they are  removed by reiserfs on mount I know they are really corrupted
> during crash. It often looks like:
Wait-wait. They are removed, so their blocks are freed and may be replaced
with other files data. Removing files is like this.
Late deletion is because application that deleted the file kept it open
until the reboot.
And no, it's not even possible to print filename at this point, because
all the links (And dierctory items) pointing at the file were already removed,
only unacessible body with nlink count of zero was left.

> I don't find this information very explicative. And I really don't know
> enough about reiserfs code to interprete these lines. BTW, can we have a
> "ReiserFS: " in front of these messages?

In fact I think these messages should not be printed at all, there is no
useful information given to the user.

> >This is unclear to me. You mean to crash a system to get a copy of deleted 
> >file,
> >or to crash a system to delete a file? Both things sound very unlikely.
> Yes, no doubt, I really don't know what is usual in these cases. I
> should explain what happened to make me write this comment. I had
> recompiled one DRI module for X recently when my system decided to
> crash. After rebooot I had some truncates-to-complete. So far "normal"
> or at least "o.k.".
> But due to anti-aliasing configured in KDE it loaded everything but
> didn't show anything else than my desktops background color and the
> mouse arrow. It took me some time to figure out how to get things back
> into previous order. It finally seems like I just needed to reinstall
> the DRI component. But until now I don't know what files had
> disappeared/corrupted to get exactly and only these ones from my backup.
> You see? Yes, not usual, but...

No, actually I do not see, if some files have disappeared, reiserfsck
should tell you about fs errors, then (like lost files, or dir entries
pointing to nowhere).
Late deletes/truncates have nothing to do with disappeared files.

> >Hm? What do you mean by latest speedup-compound-patch? I know Chris does 
> >not
> >believe iicache should be good to use, because similar functionality (with
> >less overhead) can be achieved by pagecache.
> Pagecache? How can I adjust this? Where did I read this before...?

No code in reiserfs proper exists for that yet. But it may appear in the future.

Bye,
    Oleg
