From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs tails and disk space
Date: Tue, 17 Jan 2006 10:58:13 -0800
Message-ID: <43CD3E45.6080304@namesys.com>
References: <20060117181548.GB11010@untroubled.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060117181548.GB11010@untroubled.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Cc: reiserfs-list@namesys.com, vitaly@thebsh.namesys.com

The result is not expected, Vitaly please look into it.

Hans

Bruce Guenter wrote:

>Hi.
>
>I've been running a few tests with reiserfs and tails, and have been
>unable to create a setup where the use (or lack) of tails results in a
>significant difference in the amount of disk space used.
>
>Here's what I've done:
>
>1. Create a fresh 1GB filesystem (in a file on loopback), using reiserfs
>with no options.
>
>2. Mount the filesystem with either no options, "notail", "tails=off",
>"tails=on", or "tails=small".
>
>3. Unpack a sources tarball onto the filesystem, consisting of two fully
>compiled versions of the linux kernel.  The tarball contains 47996 files
>and 3321 directories totalling about 660MB of space.
>
>4. Measure the free disk space using df.
>
>5. Use dd to fill up the free disk space and count how many 1kB blocks
>it could write.
>
>In all of the tests, the result was within 12kB of each other.  In fact,
>the tests with "notail" or "tails=off" options had more usable disk
>space than when using tails.
>
>Results:
>
>Options    1K-blocks    Used Available
>default      1023964  645988  377976
>notail       1023964  645988  377976
>tails=off    1023964  645996  377968
>tails=on     1023964  646000  377964
>tails=small  1023964  645996  377968
>
>default      377600+0 records out
>notail       377600+0 records out
>tails=off    377592+0 records out
>tails=on     377588+0 records out
>tails=small  377592+0 records out
>
>I've put the log files and scripts up for review at
>	http://untroubled.org/reiserfsdf/
>I'm using Gentoo Linux, kernel 2.6.14-gentoo-r5
>
>Am I missing something, is this an expected result, or is something
>broken?
>
>Thanks.
>  
>

