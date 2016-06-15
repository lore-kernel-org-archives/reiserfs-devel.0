From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] reiserfs: avoid uninitialized variable use
Date: Wed, 15 Jun 2016 14:15:20 +0200
Message-ID: <6368040.ggKGx5CyrW@wuerfel>
References: <1464380569-3493380-1-git-send-email-arnd@arndb.de> <1465981566.9515.21.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1465981566.9515.21.camel@tiscali.nl>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday, June 15, 2016 11:06:06 AM CEST Paul Bolle wrote:
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > I thought I had send this on May 12 when I first became aware of
> > the warning, but I can't find a reference to that now on any
> > mailing list archives, and I'm not sure who is picking up
> > reiserfs patches these days.
> > 
> > The warning is now one of the few 'allmodconfig' warnings for
> > arm64 and possibly some other architectures.
> 
> x86 and x86_64 are two of those architectures. This patch silences the
> warning on those architectures too.
> 
> (I wouldn't dare to say whether the patch is correct. I've looked at
> this warning quite a few times in the last year and found the code hard
> to grok. It's impressive that you managed to come up with an actual
> fix.)

Jan Kara has shown that my patch is completely wrong, and Jeff Mahoney
sent a correct one that is now in linux-next.

	Arnd
