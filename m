From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Filesystem Tests
Date: Wed, 6 Aug 2003 12:35:42 +0200 (MEST)
Message-ID: <Pine.LNX.4.30.0308061222360.8473-100000@divine.city.tvnet.hu>
References: <20030805224152.528f2244.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15172-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030805224152.528f2244.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: Grant Miner <mine0057@mrs.umn.edu>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com


On Tue, 5 Aug 2003, Andrew Morton wrote:

> Solutions to this inaccuracy are to make the test so long-running (ten
> minutes or more) that the difference is minor, or to include the `sync' in
> the time measurement.

And/or reduce RAM at kernel boot, etc. Anyway, I also asked for 'sync'
yesterday and Grant included some but not after every each tests.

I run the results through some scripts to make it more readable.
It indeed has some interesting things ...

           reiser4   reiserfs       ext3        XFS        JFS
copy     33.39,34%  39.55,32%  39.42,25%  43.50,32%  48.15,20%
sync      1.54, 0%   3.15, 1%   9.05, 0%   2.08, 1%   3.05, 1%
recopy1  31.09,34%  75.15,13%  79.96, 9% 102.37,12% 108.39, 5%
recopy2  33.15,33%  77.62,13%  98.84, 7% 108.00,12% 114.96, 5%
sync      2.89, 3%   3.84, 1%   8.15, 0%   2.40, 2%   3.86, 0%
du        2.05,42%   2.46,21%   3.31,11%   3.73,32%   2.42,17%
delete    7.41,52%   5.22,58%   3.71,39%   8.75,56%  15.33, 7%
tar      52.25,25%  90.83,12%  74.93,13% 157.61, 7% 135.86, 6%
sync      6.77, 2%   4.19, 3%   1.67, 1%   0.95, 1%  38.18, 0%
overall 171.28,30% 302.53,16% 319.71,11% 429.79,13% 470.88, 6%

BTW, zsh has a built-in 'time' so measuring a full operation can be
easily done as 'sync; time ( my_test; sync )'

	Szaka

