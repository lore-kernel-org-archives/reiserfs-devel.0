From: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Subject: Re: Comments about indexing and query solving in user land
Date: Mon, 6 Sep 2004 14:51:59 +0200
Message-ID: <2f4958ff040906055172c36214@mail.gmail.com>
References: <-3757055227027460326@unknownmsgid>
Reply-To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21515-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <-3757055227027460326@unknownmsgid>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Faraz S <farazs@calsoftinc.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Mon, 06 Sep 2004 14:32:34 +0530, Faraz S <farazs@calsoftinc.com> wrote:
>         In our project http://sourceforge.net/projects/linuxsfs-tm/ we did the
> attribute indexing and query parsing in the user-space and we had hooks
> in the VFS which communicated with the user-space deamons. As far as
> directory listing is concerned we had a in kernel-recordset cache
> (hashed on the query). The listing were pretty efficient.
> 
>         But the real problem occured when a large number of files were copied
> in the onto our file system. All the files now need to be indexed in the
> user space , leading to mode switch. That was pathetically slooow. The
> entire 2.4 sources were copied in 5-6 hours. I think this problem could
> be solved by batching requests the user space deamon.  Then u have all
> the problems on missing out on indexing on a large set of files.
I think that should give you pretty much explanation why whole VFS
layer and filesystems are in kernel not in user space. That's where
such sort of thing belongs to. I have no doubts.
  


-- 
GJ
