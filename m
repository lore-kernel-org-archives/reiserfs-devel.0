From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Possible bug in reiserfsck 3.6.11
Date: Tue, 23 Sep 2003 17:53:05 +0400
Message-ID: <200309231753.05358.vitaly@namesys.com>
References: <NDBBJPAGKLCMDEIEKOPBAEDMOCAA.adam@websitemanagers.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15727-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <NDBBJPAGKLCMDEIEKOPBAEDMOCAA.adam@websitemanagers.com.au>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adam Goryachev <adam@websitemanagers.com.au>
Cc: reiserfs-list@namesys.com

Hi Adam!

On Tuesday 23 September 2003 17:23, Adam Goryachev wrote:
> I had a few possible errors on my reiserfs partition, so after much thought
> etc, I unmounted it tonight and tried to run reiserfsck (after upgrading
> reiserfsck to the current version).
>
> The first run --check found some problems (I actually stopped it part way
> since I knew there were probs) so I ran --fix-fixable, this told me I still
> needed to run rebuild-tree to fix 2 problems left over. I did that, and got
> the below error, twice, exactly the same each time, so I am told (by the
> output) that it probably is not hardware error (same block each time)...
>
> build_the_tree: Nothing but leaves are expected. Block 59337 - broken leaf
>
> Aborted (core dumped)

could you extract the metadata of your fs with 
     debugreiserfs -p /dev/md1 | bzip2 -c > md1.bz2
and make it available for downloading. I will debug reiserfsprogs locally and will
figure out if there is any bug there.

-- 
Thanks,
Vitaly Fertman
