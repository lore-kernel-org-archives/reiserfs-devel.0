From: "jdow" <jdow@earthlink.net>
Subject: Re: Heuristic readahead for filesystems
Date: Wed, 11 Sep 2002 10:03:02 -0700
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <0b1701c259b5$16d6be40$1125a8c0@wednesday>
References: <Pine.LNX.4.44.0209110929390.1576-100000@blue1.dev.mcafeelabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Davide Libenzi <davidel@xmailserver.org>, Xuan Baldauf <xuan--lkml@baldauf.org>
Cc: linux-kernel@vger.kernel.org, Reiserfs List <reiserfs-list@namesys.com>

From: "Davide Libenzi" <davidel@xmailserver.org>
> On Wed, 11 Sep 2002, Xuan Baldauf wrote:
> 
> > Hello,
> >
> > I wonder wether Linux implements a kind of heuristic
> > readahead for filesystems:
> >
> > If an application reads a directory with getdents() and if
> > in the past, it stat()ed a significant part of the directory
> > entries, it is likely that it will stat() every entry of
> > every directory it reads with getdents() in the future. Thus
> > readahead for the stat data could improve the perfomance,
> > especially if the stat data is located closely to each other
> > on disk.
> >
> > If an application did a stat()..open()..read() sequence on a
> > file, it is likely that, after the next stat(), it will open
> > and read the mentioned file. Thus, one could readahead the
> > start of a file on stat() of that file.
> >
> > Combined: If an application walks a directory tree and
> > visits each file, it is likely that it will continue up to
> > the end of that tree.
> 
> M$ Win XP does exactly something like this and keep applications
> ( windows\prefetch ) and boot profiles that it uses to prefetch disk data
> and avoid long page fault latencies. It does kind-of-work but care should
> be taken adopting a similar technique on Linux ( patents ).

Davide, when was the patent on readahead taken out? It has either expired
or I can prove prior art I did myself on the old StarDrive and HardFrame
controllers for the Amiga made by Microbotics, Inc.

{^_^}    Joanne Dow, jdow@earthlink.net

