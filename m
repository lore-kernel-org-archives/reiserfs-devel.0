From: Bernhard Sadlowski <sadlowsk@mathematik.uni-bielefeld.de>
Subject: Re: NFS issues with reiserfs 3.6? ext3 works...
Date: Fri, 26 Mar 2004 17:52:35 +0100
Sender: Bernhard Sadlowski <sadlowsk@Mathematik.Uni-Bielefeld.DE>
Message-ID: <20040326165235.GM1315@mathematik.uni-bielefeld.de>
References: <20040326115302.GD1315@mathematik.uni-bielefeld.de> <1080307106.5920.1.camel@tribesman.namesys.com> <1080308538.2822.95.camel@watt.suse.com> <20040326140939.GH1315@mathematik.uni-bielefeld.de> <1080310685.2820.104.camel@watt.suse.com> <20040326142015.GI1315@mathematik.uni-bielefeld.de> <1080315224.5920.17.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1080315224.5920.17.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

On 26 Mar 2004 18:33, Vladimir Saveliev <vs@namesys.com> wrote:
> I looked at straces you sent. The substantial differences start after
> sendto() I quote below. If in both cases 'dt mkdir' tries to create a
> directory on nfs mounted directory - then why does reiserfs send
> something to 127.0.0.1 whereas ext3 sends to 145.228.118.41?
> 
> reiserfs:
> getpid()                                = 27812
> sendto(5, "\\\252\1H\0\0\0\0\0\0\0\2\0\4\224\345\0\0\0\2\0\0\0\1\0"...,
> 84, 0, {sa_family=AF_INET, sin_port=htons(892),
> sin_addr=inet_addr("127.0.0.1")}, 16) = 84
> 
> ext3:
> getpid()                                = 27652
> sendto(5, "RM\347\254\0\0\0\0\0\0\0\2\0\4\224\345\0\0\0\2\0\0\0\1"...,
> 68, 0, {sa_family=AF_INET, sin_port=htons(687),
> sin_addr=inet_addr("145.228.118.41")}, 16) = 68

This IP address belongs to the NFS and Ethershare server dematl04. No
one knows what they are doing here. It seems we have to contact Helios
to resolve this. 

A quick check with "dt mkdir ..." on a fresh reiserfs partition (12GB)
did work now...! The NFS shared partition with problems is a bigger raid
with about 440GB size. Maybe there are some problems in helios, dt, nfs
or reiserfs handling bigger blockdevices? So we should create a bigger
ext3 filesystem and retest again...

Thank you for your time Vladimir and Chris!

Bernhard
