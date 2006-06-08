From: Tom Vier <tmv@comcast.net>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Thu, 8 Jun 2006 10:18:02 -0400
Message-ID: <20060608141802.GB5851@zero>
References: <20060523155102.GB25889@zero> <20060606134459.GA18513@zero> <1149604706.6389.40.camel@tribesman.namesys.com> <20060606153035.GF10672@HAL_5000D> <4485D69B.1090608@namesys.com> <20060607001323.GG10672@HAL_5000D> <5c49b0ed0606071755w3412e2eave2e3449361cd8b42@mail.gmail.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28771-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5c49b0ed0606071755w3412e2eave2e3449361cd8b42@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nate Diller <nate.diller@gmail.com>
Cc: reiserfs-list@namesys.com

On Wed, Jun 07, 2006 at 05:55:25PM -0700, Nate Diller wrote:
> this is something i've been wanting to address for a while now.  at
> the moment, the VM starts to flush pages when
> /proc/sys/vm/dirty_background_ratio is exceeded, and it flushes pages
> without regard to which process dirtied them or which file they are
> in.  it begins to throttle processes (make them wait for some dirty
> pages to be cleaned before they can dirty more of them) when
> dirty_ratio is exceeded.

That ratio is something i'll have to play with.
/proc/sys/vm/dirty_writeback_centisecs looks like it could help me as well.
With two (and eventually ext3, as well) fs'es using delayed allocation, it
may be best to change those values (especially when you have several gigs of
ram). I don't suspose there's a way to make it per fs, tho. fs'es don't walk
dirty pages, do they? Only the vm decides when to write out? ext3 and r4 do
have write timeouts, tho.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
