From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: Heuristic readahead for filesystems
Date: Wed, 11 Sep 2002 13:42:06 -0300 (BRT)
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44L.0209111340060.1857-100000@imladris.surriel.com>
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

> I wonder wether Linux implements a kind of heuristic
> readahead for filesystems:

> If an application did a stat()..open()..read() sequence on a
> file, it is likely that, after the next stat(), it will open
> and read the mentioned file. Thus, one could readahead the
> start of a file on stat() of that file.

> Example: See this diff strace:

Your observation is right, but I'm not sure how much it will
matter if we start reading the file at stat() time or at
read() time.

This is because one disk seek takes about 10 million CPU
cycles on modern systems and we'll have completed the stat(),
open() and started the read() before the disk arm has started
moving ;)

regards,

Rik
-- 
Bravely reimplemented by the knights who say "NIH".

http://www.surriel.com/		http://distro.conectiva.com/

Spamtraps of the month:  september@surriel.com trac@trac.org
