From: Ookhoi <ookhoi@humilis.net>
Subject: Re: reiserfs for cluster
Date: Tue, 6 May 2003 16:57:16 +0200
Message-ID: <20030506165716.G2196@humilis>
References: <5.2.0.9.0.20030506160902.03b1da60@pop.puretec.de>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5.2.0.9.0.20030506160902.03b1da60@pop.puretec.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juergen Waiblinger <juwa@triplestor.com>
Cc: reiserfs-list@namesys.com

Juergen Waiblinger wrote (ao):
> we are running different beowulf clusters and the storage amount
> increases all the time. Until now we have been using Veritas
> Clusterfilesystem, but for different reasons we want to go for an
> other solution. As we are using reiserfs quite happily on the desktops
> we thought about using this for the storagesubsystem attached to the
> masterserver of the cluster.
> there will only be sun and linux machines accessing the files but
> there will be concurrent file access.
> Has anybody tried this or could give some other solutions Any
> information will be appreciated

With the current 300GB sata disks, 3ware controllers and a full tower
which can handle 20 disks you can create a 5.3TB raid. mkreiserfs it,
stress-test it for a while and see if it works for you. Also try xfs and
compare it with reiserfs.
