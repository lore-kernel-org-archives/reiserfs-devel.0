From: Oliver Neukum <oliver@neukum.name>
Subject: Re: Heuristic readahead for filesystems
Date: Wed, 11 Sep 2002 20:30:27 +0200
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <200209112030.27269.oliver@neukum.name>
References: <Pine.LNX.4.44L.0209111340060.1857-100000@imladris.surriel.com> <3D7F83BC.5DF306A@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <3D7F83BC.5DF306A@baldauf.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Xuan Baldauf <xuan--reiserfs@baldauf.org>, Rik van Riel <riel@conectiva.com.br>
Cc: Xuan Baldauf <xuan--lkml@baldauf.org>, linux-kernel@vger.kernel.org, Reiserfs List <reiserfs-list@namesys.com>


> In theory, this also could be implemented explicitly if the application
> could tell the kernel "I'm going to read these 100 files in the very
> near future, please make them ready for me". But wait, maybe the
> application can do this (for regular files, not for directory entries
> and stat() data): Could it be efficient if the application used
> open(file,O_NONBLOCK) for the next 100 files and subsequent read()s on
> each of the returned filedescriptors?

What do you want to trigger the reading ahead, open() or read() ?
Please correct me, if I am wrong, but wouldn't read() block ?

Aio should be able to do it. But even that want help you with the stat data.

	Regards
		Oliver
