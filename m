From: Anders Widman <andewid@tnonline.net>
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 19:37:48 +0200
Message-ID: <1423022324.20030428193748@tnonline.net>
References: <3EAD34D5.8030108@solidcode.net>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EAD34D5.8030108@solidcode.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hi,

> I am looking for a solution for the following problem:

> On a legacy system for newspaper workflow, files are delivered to a 
> certain directory (for example ~/input).
> These files (in TIFF format) can be quite large (10 to 400 MB), they 
> could be copied over the local filesystem, a Samba share or via FTP.
> When large files are copied over the network these files show up in 
> ~/input while they are being copied (you can see the filesize grow).

> However TIFF files are only useful for further processing when they are 
> complete.

> Initially we solved this problem by monitoring the input directory and
> make our applications look at the files until they stop growing, but 
> this isn't a very elegant and reliable method.

  No,  and  it  won't  give  confirmation  that  the  file actually is
  complete.

  You  can  set Samba to issue a lock on the files while transferring.
  This  should  be enough to see if the file has finished transferring
  or not.

> After a while we discovered the UNIX 'fuser' command so that we could 
> see if the incoming file is still being transferred or not.
> This works fine but it's still not very elegant, and it requires root 
> privileges for the applications involved in the workflow.

> Naturally, the best solution would be for the sender to notify the 
> completion of the transfer. But this is not an option because several 
> organizations are involved that do not wish to adapt their software.

> Right now I am wondering if this is something that could be solved on 
> the filesystem level, i.e. is it possible to 'only see files that are 
> not in the process of being transferred'.

> Is this possible with Reiser3? Reiser4? Should it be solved on the
> filesystem level?

  Sounds rather extreme measures.

> Any thoughts on this matter are appreciated.

> Kind regards,

>    Erik Terpstra.



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

