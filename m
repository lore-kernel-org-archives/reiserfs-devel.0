From: Gerrit Hannaert <degerrit@web.de>
Subject: Re: reiserfs for cluster
Date: Tue, 06 May 2003 23:01:22 +0200
Message-ID: <3EB822A2.3090005@web.de>
References: <5.2.0.9.0.20030506160902.03b1da60@pop.puretec.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13973-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5.2.0.9.0.20030506160902.03b1da60@pop.puretec.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Juergen Waiblinger <juwa@triplestor.com>

I've tried something like this on a SAN a while ago, using ext3, but
perhaps the results would not be so different using reiserfs. The
situation we were looking at involved flat-file database updates which
would occur only once every day or even less than that.

Obviously the major issue is who has write-access; but things seem to
work if:
- one machine does the writes, after which the other machines will need
to re-mount the filesystem (probably works best if writes affect new
files, and are not appends/modifications...). Otherwise new files will
not show up because this data is cached (I expect someone else can give
some better low-level explanation and possible workarounds)...
- filesystem on read-only machines is mounted with journaling disabled,
and the noatime,ro options (updating access times are writes, too).
Otherwise the filesystem will not be in a consistent state, and will be
checked every time you mount it.

There may be other alternatives, but this is a simple solution if your
'write demands' are not too high. I haven't done much performance or
scalability tests so I don't know if this method is preferrable over NFS
and such (but it's so much cooler!).

Cheers,

- Gerrit


Juergen Waiblinger wrote:

> Hello,
>
> we are running different beowulf clusters and the storage amount
> increases all the time. Until now we have been using Veritas
> Clusterfilesystem, but for different reasons we want to go for an
> other solution. As we are using reiserfs quite happily on the desktops
> we thought about using this for the storagesubsystem attached to the
> masterserver of the cluster.
> there will only be sun and linux machines accessing the files but
> there will be concurrent file access.
> Has anybody tried this or could give some other solutions
> Any information will be appreciated
>
> TIA will summarize to the list
>


