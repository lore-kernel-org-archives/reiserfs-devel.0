From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: filesystem corruption ?
Date: Thu, 20 Mar 2003 19:23:48 +0100
Sender: Bernd Schubert <Bernd.Schubert@tc.pci.uni-heidelberg.de>
Message-ID: <200303201923.48454.bernd-schubert@web.de>
References: <200303201725.14039.bernd-schubert@web.de> <20030320200639.A8618@namesys.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_0cge+MgCubwN4KQ"
Return-path: <reiserfs-list-return-13307-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030320200639.A8618@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

--Boundary-00=_0cge+MgCubwN4KQ
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 20 March 2003 18:06, Oleg Drokin wrote:
> Hello!
>
> On Thu, Mar 20, 2003 at 05:25:13PM +0100, Bernd Schubert wrote:
> > We use this filesystem a nfs-root-fs to several clients (exported as
> > read-only), so we are lucky, since we regularly backup the whole
> > partition. We have a backup from this Morning and another one from
> > Monday. Based on comparing the output of md5sum we can't find any
> > problems between the version from monday and the version of this morning,
> > *but* there are differences for some binaries in /usr/bin, such as gdb,
> > between the backup of this Morning and the Current files.
>
> Hm, interesting.
> And what are the differences? How big are they?

Since it are binaries files, a colleague had the idea to use hexdump and diff, 
so the command for the attached file was:

diff <(hexdump /worka/gdb) <(hexdump /usr/bin/gdb)|sort -k 2 >gdb.diff

So the lines beginning with '<' are from working gdb and lines beginning with 
'>' are from corrupted gdb. When you look into the diff-file you will see, 
that only some bits per line have changed.

> Anything interesting in logs?

Except perhaps 'Mar 20 16:46:58 hamilton kernel: invalidate: busy buffer', 
nothing else.


> Any events happening between morning backup and time of problem discovery?

Except, that I recompiled a kernel and we installed some programs using 
aptitude (its a debian system), nothing happend to the filesystem. There was 
also no reboot, no crash, etc.

Update: The corruption probably happend at 15:48, since at this time also a 
xchat on one of the clients crashed and this was noticed by us at first. The 
xchat binary was also affected by the corruption.
At the very same time another client was rebooted and something seems to have 
caused a very strange nfs-mounting from this machine. However, we see 189 
mount tries for '/', '/etc' and '/var' within 5 seconds from this client, 
finally it was succesfull, thatswhy we didn't notice the strange mounting 
scheme. Please note again that we export '/' read-only, so the client 
shouldn't be able to corrupt the files.
Since it turn out, that the nfs-corruption could be nfs related, I have to 
give further information about our server/client solution:
	We have both, knfsd and unfsd (clusternfs) running on our server,
	knfsd serves '/' (read-only, reiserfs) and unfsd serves '/etc' and '/var' 
(read-write, ext2). 
	Due to current kernel limitation both have to use the same rpc-port, but 
luckily not the same upd/tcp port (but both mountd's are running on different 
rpc-ports and different tcp/upd ports).
I hope that this is not the reason for our trouble, anyway I wouldn't know how 
this could cause this kind of trouble at all.

I'm now going to modify the client's initrd and prevent something like this.

>
> > Do you have any ideas whats going wrong and what we can do?
>
> We need more info.

Just tell me what else you need! Should we run debugreiserfs ?

> Also check modification date of gdb, may be some process changed it?

Its not only gdb, also several other programs. The modification time and 
filesize are the same.


Thanks for your help,
	Bernd

--Boundary-00=_0cge+MgCubwN4KQ
Content-Type: application/x-gzip;
  name="gdb.diff.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="gdb.diff.gz"

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
adKvwJM7XOTkVsZqSLgx8X8wbDWgeDcAAA==

--Boundary-00=_0cge+MgCubwN4KQ--
