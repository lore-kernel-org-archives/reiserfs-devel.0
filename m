From: Richard Sharpe <rsharpe@richardsharpe.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer (purely performance)
Date: Sat, 14 Dec 2002 14:34:06 -0800 (PST)
Message-ID: <Pine.LNX.4.33.0212141429010.2681-100000@ns.aus.com>
References: <3DFBA067.5040601@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12163-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DFBA067.5040601@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: darren <teodarren@myrealbox.com>, 'Russell Coker' <bofh@coker.com.au>, reiserfs-list@namesys.com

On Sun, 15 Dec 2002, Hans Reiser wrote:

> darren wrote:
> 
> >Hi all,
> >
> >Thanks for all the very informative bits on this thread.
> >
> >In my usage, I intend to implement this fileserver to complement another
> >server that runs a very intensive small files read/write operation.
> >
> >These files often run into 200,000 or more but are usually in the range
> >of 100kb or less.
> >
> >Hence, space is not a big issue to me, but performance is. (there's no
> >point splitting out the IO from the main server if it runs slower!!).
> >
> >I will be using an spare server to do this job: Dell Xeon 2GHz with 5 x
> >72Gb SCSI hdd (I got on board RAID but have not decided on how to
> >configure yet -help here are welcome too!).
> >
> >My options are: Win2k (NTFS with CIFS), Linux (Reiserfs with Samba) or
> >Netapp 870.

If those are your choices, then I would rank them:

  NetApp F870, Linux with ReiserFS and Samba, Win2K

John Terpstra has done some testing with a modified cifs_bm which confirms 
that Linux with EXT2/3 or ReiserFS outperforms Win2K on the same hardware.

However, my testing of the NetApp suggests it will outperform the other 
two choices.

If you choose to use Samba, you will want to make sure that the sendfile 
stuff is implemented. Unfortunately, the directory indexing in Reiser does 
not help that much a lot of the time because Samba is forced to do 
directory scans because it has to implement case-independent 
lookups/searches.

Regards
-----
Richard Sharpe, rsharpe[at]ns.aus.com, rsharpe[at]samba.org, 
sharpe[at]ethereal.com, http://www.richardsharpe.com

