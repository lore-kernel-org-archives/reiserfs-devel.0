From: Hans Reiser <reiser@namesys.com>
Subject: Re: Compression Plugin
Date: Tue, 06 Jun 2006 12:19:41 -0700
Message-ID: <4485D54D.30606@namesys.com>
References: <433017C1.4050408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28747-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <433017C1.4050408@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clay Barnes <clay.barnes@gmail.com>
Cc: reiserfs-list@namesys.com

Clay Barnes wrote:

>Forgive me if this has been answered recently, but I haven't gotten my
>last two dozen e-mails for today yet.
>
>Regarding the compression plugin, what sort of compression can one
>expect from it?  I know that compression of files like bz2 will vary (in
>that they'll be essentially uncompressed) from source/text files
>(excellent compression).  A rough estimate from someone's experience
>using on mixed files it would help.
>
>Also:  Is the algorithm set in stone?  If so what is it?  If not, what
>is it now/expected to be?
>  
>
It is lzo1.  There are multiple compression algorithms to choose from,
one of them is gzip (more cpu but better compression).  lzo1 gets > 50%
on text and executables and nothing on mp3s and video.

>Thanks,
>Clay Barnes
>
>
>  
>

