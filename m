From: Bernhard Sadlowski <sadlowsk@mathematik.uni-bielefeld.de>
Subject: Re: NFS issues with reiserfs 3.6? ext3 works...
Date: Fri, 26 Mar 2004 15:09:39 +0100
Sender: Bernhard Sadlowski <sadlowsk@Mathematik.Uni-Bielefeld.DE>
Message-ID: <20040326140939.GH1315@mathematik.uni-bielefeld.de>
References: <20040326115302.GD1315@mathematik.uni-bielefeld.de> <1080307106.5920.1.camel@tribesman.namesys.com> <1080308538.2822.95.camel@watt.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17494-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1080308538.2822.95.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

Hi Chris,

On 26 Mar 2004 08:42, Chris Mason <mason@suse.com> wrote:
> Does Helios Ethershare use the standard linux in kernel nfs server, or
> does it patch things somehow?

System1 (dematl04) is Debian/woody with Linux 2.4.25 kernel-nfs-server
System2 (dematl08) is Redhat9 with Linux 2.4.25 with its standard nfs client

I did compile both kernels myself from original kernel.org source. 

So no, it does not patch the system. Everything is standard and
out-of-the box. Helios is installed in /usr/local/helios as an
additional application. Helios Ethershare uses just the appletalk kernel
module for networking.

Probably "dt" is showing some difference, feature or bug in reiserfs. Of
course... the source of dt has only Helios. ( -> http://www.helios.de )

Some new applikation now requires that "dt" is working over NFS. We are
currently using reiserfs on all of our production servers because of its
great features and speed, and it would hurt if we had to convert to
ext3.

Bernhard
