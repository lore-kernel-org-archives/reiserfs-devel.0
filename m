From: Davide Libenzi <davidel@xmailserver.org>
Subject: Re: Heuristic readahead for filesystems
Date: Wed, 11 Sep 2002 09:33:52 -0700 (PDT)
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0209110929390.1576-100000@blue1.dev.mcafeelabs.com>
References: <3D7F647B.1E0707FB@baldauf.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <3D7F647B.1E0707FB@baldauf.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xuan Baldauf <xuan--lkml@baldauf.org>
Cc: linux-kernel@vger.kernel.org, Reiserfs List <reiserfs-list@namesys.com>

On Wed, 11 Sep 2002, Xuan Baldauf wrote:

> Hello,
>
> I wonder wether Linux implements a kind of heuristic
> readahead for filesystems:
>
> If an application reads a directory with getdents() and if
> in the past, it stat()ed a significant part of the directory
> entries, it is likely that it will stat() every entry of
> every directory it reads with getdents() in the future. Thus
> readahead for the stat data could improve the perfomance,
> especially if the stat data is located closely to each other
> on disk.
>
> If an application did a stat()..open()..read() sequence on a
> file, it is likely that, after the next stat(), it will open
> and read the mentioned file. Thus, one could readahead the
> start of a file on stat() of that file.
>
> Combined: If an application walks a directory tree and
> visits each file, it is likely that it will continue up to
> the end of that tree.

M$ Win XP does exactly something like this and keep applications
( windows\prefetch ) and boot profiles that it uses to prefetch disk data
and avoid long page fault latencies. It does kind-of-work but care should
be taken adopting a similar technique on Linux ( patents ).



- Davide

