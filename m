From: "Nate Diller" <nate.diller@gmail.com>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Wed, 7 Jun 2006 17:41:40 -0700
Message-ID: <5c49b0ed0606071741w6d954d1bue8082520af88cabe@mail.gmail.com>
References: <20060523155102.GB25889@zero> <20060606134459.GA18513@zero>
	 <1149604706.6389.40.camel@tribesman.namesys.com>
	 <20060607175828.GA4670@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060607175828.GA4670@zero>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

On 6/7/06, Tom Vier <tmv@comcast.net> wrote:
> On Tue, Jun 06, 2006 at 06:38:26PM +0400, Vladimir V. Saveliev wrote:
> > reiser4 has an option for that.
> > mount -o tmgr.atom_max_age=N
> > N is decimal number of seconds. Changes older than N will be forced to
> > commit.
>
> Unfortunetly, this causes even more read pauses from the source, when
> running rsync. I also tried cpio (-p mode) and cp -a, same pauses. When
> syncing, r4 seems to have about a 5 second pause, then a burst of seeks and
> writes. I also tried disabling clock throttling, no difference. I have a
> fast system. Two single core 2.6ghz opterons. CPU time during the pause
> after sync and before the writes doesn't seem to very high. I thought r4
> might be cpu bound, but it doesn't seem to be. I'm not sure what's causing
> this pause. If i had more free time, i'd setup kernel profiling.

this could easily be a disk scheduler issue.  in particular, reiser4
may be interacting with the block device congestion code, leading it
to fail to submit all the writes at once.  this may be helped by the
upconing patch for creating bio structures more than 4k at a time, or
by using a different scheduler.

try 'echo 512 > /sys/block/[dev]/queue/nr_requests' and see if the
behaviour changes

NATE
