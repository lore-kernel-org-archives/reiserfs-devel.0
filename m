From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Reiser4 too fragile..?
Date: Fri, 4 Mar 2005 09:53:19 +0200
Message-ID: <200503040953.19617.rmeijer@internet.gr>
References: <200503031509.57890.rmeijer@internet.gr> <1109864016.3503.518.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1109864016.3503.518.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu 3 March 2005 17:33, Vladimir Saveliev wrote:

> > Nearly every time my machine crashed the past year or so (which
> > doesn't happen often) it left my Reiser4 partitions (/usr in
> > particular) riddled with file system errors.

> What kind of load did your desktop do when it crashed?

Not too much.. X.org, KDE, Firefox. Nothing special really. The only 
crashes I've ever had were related to X, or, very long ago, Reiser4.

> Which kernels did you use?

2.6.x with cko patches or ck+reiser4.

The last crash happened in X with 2.6.10-ck7+reiser4, before that
2.6.9-cko-something if I remember correctly.

And I always compile kernels and reiser4progs without compiler
optimisations.

> Please also tell more about filesystems you had on your desktop.

Almost everything was Reiser4:

/dev/ide/host0/bus0/target0/lun0/part1 on / type reiser4 (rw,noatime,nodiratime)
/dev/mapper/sys-usr on /usr type reiser4 (rw,nodev,noatime,nodiratime)
/dev/mapper/sys-src on /usr/src type reiserfs (rw,nosuid,nodev,noatime,nodiratime)
/dev/mapper/sys-var on /var type reiser4 (rw,nosuid,nodev,noatime,nodiratime)
/dev/mapper/sys-cache on /var/cache type reiser4 (rw,noexec,nosuid,nodev,noatime,nodiratime)
/dev/mapper/extra-squid on /var/spool/squid type reiser4 (rw,noexec,nosuid,nodev,noatime,nodiratime)
/dev/mapper/sys-home on /home type reiser4 (rw,nosuid,nodev,noatime,nodiratime)
/dev/mapper/sys-tmp on /tmp type reiser4 (rw,noexec,nosuid,nodev,noatime,nodiratime)
/dev/mapper/extra-music on /extra/music type reiserfs (ro,noexec,nosuid,nodev,noatime,nodiratime)

I never really found any Reiser4 errors in the syslog. But very often
/usr wouldn't even mount after a reboot so I had to boot with
"init=/bin/bash", vgscan, vgchange, fsck.reiser4 etcetera :(

I'm quite disappointed basically and I'll wait before converting
partitions of (production) servers to Reiser4.


Thank you,

Ray
