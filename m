From: Sean Plaice <splaice@gmail.com>
Subject: Re: reiserfs errors in dmesg output
Date: Wed, 14 Jul 2004 03:45:40 -0700
Message-ID: <ae9bd76a04071403452dbe056b@mail.gmail.com>
References: <ae9bd76a040703052222e0065f@mail.gmail.com> <40E6AC37.1090609@namesys.com> <ae9bd76a0407031610bfd1c7d@mail.gmail.com> <40E7C2BA.8050003@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19609-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40E7C2BA.8050003@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Sun, 04 Jul 2004 12:41:30 +0400, Vladimir V. Saveliev <vs@namesys.com> wrote:
> Sean Plaice wrote:
> >>>sd(8,6):journal-1777: buffer 109798 bad state !PREPARED !LOCKED !DIRTY
> >>> JDIRTY_WAIT
> >>>sd(8,6):journal-1777: buffer 185659 bad state !PREPARED !LOCKED !DIRTY
> >>> JDIRTY_WAIT
> >>>sd(8,6):journal-1777: buffer 208840 bad state !PREPARED !LOCKED !DIRTY
> >>> JDIRTY_WAIT
> >>>sd(8,6):journal-1777: buffer 300870 bad state !PREPARED !LOCKED !DIRTY
> >>> JDIRTY_WAIT
> >>>
> >>
> >>IIRC, sometime ago, there were some fixes for race conditions which
> >>might cause this. Chris, would you please confirm that?
> >
> >
> > If this is a race condition that is specific to the kernel I am
> > running could this lead to corruption or system instability?
> > 
> Still waiting for Chris reply
> 
> 
I notived this thread sort of died, but the possible race condition is
still occuring. I have scheduled an outage window to upgrade the
kernel to the lastest Fedora Core distributed kernel release.

If the problem persists I will just build my own kernel from the
lastest 2.4.x vanilla tree. If the problem persists there I will
update this thread once again.

-- 
Sean
