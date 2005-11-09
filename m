From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: SOLVED: reiser4 in 2.6.14 - lockups with mmapped files
Date: Wed, 9 Nov 2005 10:25:28 +0200
Message-ID: <200511091025.28297.rmeijer@internet.gr>
References: <1130860221.12859.23.camel@laptop> <1131138753.14425.2.camel@laptop> <20051109002158.GA21403@148.Red-217-126-33.pooles.rima-tde.net.>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051109002158.GA21403@148.Red-217-126-33.pooles.rima-tde.net.>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed 9 Nov 2005 2:21, rvalles wrote:

> If you are refering to 2.6.14-arckck3, I tried it and it doesn't fix a
> thing. Even more, it triggers it more often, probably related to it's
> agressivity against cache (swap prefetch, less tendency to swap, etc.).

I'm using 2.6.14-archck3.

Could one of the symptoms be that apt/dpkg gets stuck if its files are on a 
Reiser4 partition?

After installing 2.6.14-archck3 and rebooting I found that aptitude etc. 
didn't work any longer and I couldn't even kill the processes when they got 
stuck?!

When I reformatted the repository's partition (/var/cache/apt) to ReiserFS the 
problem disappeared.

The funny thing is that I don't experience problems with the rest of my 
Reiser4 partitions:

/dev/mapper/system-tmp on /tmp type reiser4 (rw)
/dev/mapper/system-squid on /var/spool/squid type reiser4 (rw)
/dev/mapper/extra-music on /extra/music type reiser4 (rw)

The apt repository looks like this now:

/dev/mapper/system-cache on /var/cache type reiserfs (rw)


For what it's worth,

Ray
