From: Frederick Page <fpage@thebetteros.oche.de>
Subject: Re: r5 hash detected, unable to force r5 hash
Date: Sat, 20 Apr 2002 21:00:25 +0200
Message-ID: <20020420190025.GA6982@thebetteros.oche.de>
References: <20020419185715.GA3936@thebetteros.oche.de> <20020420150339.A28989@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10095-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020420150339.A28989@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Oleg,

Oleg Drokin wrote on Sat, Apr 20 2002:

>   This is user error.

Agreed.

>   Because it is clearly stated that if you want to convert to new hash,
>   you need to backup your data, reformat FS with new hash and put all the
>   data back.

I am still unable to find this in the docs. Could you please tell me,
which FM I obviously did not read?

>   User errors are dealt with based on http://namesys.com/support.html
>   terms.

Feature: you can change the hash once, but then are stuck with it, you
cannot change it back (unless you rebuild the tree).

Feature: mount does not give you any hint, that you are doing
something potentially harmful, which cannot be undone (reiserfsck does).

Feature: the documented mount-option "hash=r5" does not work, instead
gives message "error, r5 hash detected, unable to force r5 hash" (what
the message mean?). It even does this, when r5 is already in the
superblock.

Feature: this "r5 detected, unable ..." persists since at least
September 2001.


I really do appreciate your feedback, but at least I see a possibility
for the developer-team to improve reiserfs further. Please don't get
me wrong: I do not blame the reiserfs-guys for anything, I did change
the hash without full knowledge about what I was going to do (that's
clearly my mistake).

At least the mount-option "hash=r5" definately does *not* work as
documented. I'm still a little bit puzzled, why you did not even
acknowledge that, but put the blame entirely on me.

Kind regards

Frederick

