From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [patch 0/4] reiser4: pending bugfixes, cleanups
Date: Tue, 13 Oct 2009 19:58:28 -0700
Message-ID: <20091013195828.c9a95769.akpm@linux-foundation.org>
References: <4AC94065.8020303@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4AC94065.8020303@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>


reiser4 is currently disabled in -mm (via reiser4-disable.patch)
because recent changes to fs/fs/writeback.c wrecked the build.  I fixed
it about ten times as the underlying code was churning, then gave up.  It
would be nice if you take a look at that sometime please.



