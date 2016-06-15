From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] reiserfs: avoid uninitialized variable use
Date: Wed, 15 Jun 2016 18:39:43 +0200
Message-ID: <1466008783.28441.3.camel@tiscali.nl>
References: <1464380569-3493380-1-git-send-email-arnd@arndb.de>
	 <1465981566.9515.21.camel@tiscali.nl> <6368040.ggKGx5CyrW@wuerfel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <6368040.ggKGx5CyrW@wuerfel>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On wo, 2016-06-15 at 14:15 +0200, Arnd Bergmann wrote:
> Jan Kara has shown that my patch is completely wrong, and Jeff Mahoney
> sent a correct one that is now in linux-next.

That must be "reiserfs: fix "new_insert_key may be used uninitialized
..."". I missed it because, for some reason, the discussion of your
patch never hit lkml but only reiserfs-devel. And also because I
obviously didn't bother checking linux-next before replying to your
message.

Thanks,


Paul Bolle
