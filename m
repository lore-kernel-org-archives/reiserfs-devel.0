From: Oleg Drokin <green@namesys.com>
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 18:32:31 +0400
Message-ID: <20030428143231.GA11226@namesys.com>
References: <3EAD34D5.8030108@solidcode.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13863-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EAD34D5.8030108@solidcode.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik Terpstra <erik@solidcode.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Apr 28, 2003 at 04:04:05PM +0200, Erik Terpstra wrote:
> I am looking for a solution for the following problem:
> On a legacy system for newspaper workflow, files are delivered to a 
> certain directory (for example ~/input).
> These files (in TIFF format) can be quite large (10 to 400 MB), they 
> could be copied over the local filesystem, a Samba share or via FTP.
> When large files are copied over the network these files show up in 
> ~/input while they are being copied (you can see the filesize grow).
> Naturally, the best solution would be for the sender to notify the 
> completion of the transfer. But this is not an option because several 
> organizations are involved that do not wish to adapt their software.
> Right now I am wondering if this is something that could be solved on 
> the filesystem level, i.e. is it possible to 'only see files that are 
> not in the process of being transferred'.
> Is this possible with Reiser3? Reiser4? Should it be solved on the 
> filesystem level?

How about such a generic solution:

you create /incoming/.temp (or /incoming.tmp), all the files are being written
there. When write is complete, you just do rename(2) from tempdir to /incoming
This is atomic operation, files will apear immediately in place in their full
size.

FTP knows how to rename stuff at remote location.
I will be surprised if samba does not know how to do that.

Bye,
    Oleg
