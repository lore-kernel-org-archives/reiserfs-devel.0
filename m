From: Russell Coker <russell@coker.com.au>
Subject: Re: reiserfs for cluster
Date: Wed, 7 May 2003 03:09:05 +1000
Message-ID: <200305070309.05152.russell@coker.com.au>
References: <5.2.0.9.0.20030506160902.03b1da60@pop.puretec.de> <20030506165716.G2196@humilis>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13967-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030506165716.G2196@humilis>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ookhoi@humilis.net, Juergen Waiblinger <juwa@triplestor.com>
Cc: reiserfs-list@namesys.com

On Wed, 7 May 2003 00:57, Ookhoi wrote:
> Juergen Waiblinger wrote (ao):
> > we are running different beowulf clusters and the storage amount
> > increases all the time. Until now we have been using Veritas
> > Clusterfilesystem, but for different reasons we want to go for an
> > other solution. As we are using reiserfs quite happily on the desktops
> > we thought about using this for the storagesubsystem attached to the
> > masterserver of the cluster.
> > there will only be sun and linux machines accessing the files but
> > there will be concurrent file access.
> > Has anybody tried this or could give some other solutions Any
> > information will be appreciated
>
> With the current 300GB sata disks, 3ware controllers and a full tower
> which can handle 20 disks you can create a 5.3TB raid. mkreiserfs it,
> stress-test it for a while and see if it works for you. Also try xfs and
> compare it with reiserfs.

=46rom Juergen's description I get the impression that he has a clustered f=
ile=20
system.  A clustered file system such as GFS is more what he's asking for:
http://www.sistina.com/solutions_fileserve.html

However ReiserFS in a configuration such as you describe may be a viable=20
option and will certainly be a lot cheaper.  I believe that ReiserFS does N=
=46S=20
well now and it should be a good option.

=2D-=20
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

