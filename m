From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: 2.6.30-rc3: reiserfs: WARNING: at fs/namei.c:1251
	lookup_one_len
Date: Wed, 29 Apr 2009 05:51:18 +0100
Message-ID: <20090429045118.GG8633@ZenIV.linux.org.uk>
References: <a4423d670904261715q4510bdd3u2eb1ac3b90566fbc@mail.gmail.com> <20090428201310.fd2c6c96.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090428201310.fd2c6c96.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, David <david@unsolicited.net>

On Tue, Apr 28, 2009 at 08:13:10PM -0700, Andrew Morton wrote:
> : Yeah, the sanity check had caught another place misusing lookup_one_len().
> : I'd keep the warning in place for now; I think I know how to deal with
> : reiserfs side of things, but if it turns out too invasive for post-rc3,
> : we can always turn the check off just for -final.  For now I'd keep the
> : check in place, just to see if anything else runs into it.
> 
> It would be nice to plug this sooner rather than later please, to save
> a bit of bug-reporting bandwidth.

Post-rc4; I've a preliminary for that one, but it'll need to be untangled
to go in at that phase.  I think I know how to make it reasonably non-invasive,
but that's still not finished.
