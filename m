From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Sat, 28 Jun 2003 13:58:47 +0400
Message-ID: <20030628095847.GA19610@namesys.com>
References: <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14773-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EFCC72F.9020100@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Sat, Jun 28, 2003 at 12:37:35AM +0200, Christian Kujau wrote:

> >Well, the corruptions are different indeed.
> >Can you also publish debugreiserfs -d /dev/whateverdev
> >output (it is preferable that there would be new FS with only
> >one or two files written and immediately unmounted).
> i've done so, debugreiserfs-test.stdout is in ../reiserfs on the known
> address. let me repeat, that not _all_ files in the fs are corrupted.
> the two textfiles i have just written into the newly created reiserfs
> are _not_ different from their origins. however, when i copy many files,
> a certain amount of files get corrupted.

Well, looking at this metadata dump, I cann reasonably assure you that
this dump was taken from fs that was written to without first applying
the patch I sent. (same block, zero, block, zero pattern in indirect items)

In other mails you write that now you see only some of files are differs
(as opposed to every file gets corrupted). Or may be there is a pattern
like "files less than 8k in size are uncorrupted and everything bigger
is corrupted"?
So can I look at the debugreiserfs -d output for the filesystm where
that happens (and I want to know filename of a corrupted file too).

My own alpha boot attempts are doomed it seems. the kernel I build on alpha itself
jumps to address zero before starting init. Hm. Or may be it is just unhappy with gcc 3.2.2,
time to build gcc 2.95.3 there, it seems.

Thank you.

Bye,
    Oleg
