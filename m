From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: problems with /var/lib/dpkg/info
Date: Sat, 10 Aug 2002 06:54:39 -0400
Message-ID: <200208100654.39202.tomlins@cam.org>
References: <20020810090529.GA411@home>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11156-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020810090529.GA411@home>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Radim Kolar <hsn@cybermail.net>, reiserfs-list@namesys.com

On August 10, 2002 05:05 am, Radim Kolar wrote:
> I have 3 debian gnu linux machines here with reiserfs. I am using
> reiserfs about 2 years and when i have some kind of problem with
> reiserfs  -  it is allways  with /var/lib/dpkg/info  directory.
> It looks like  there is  too many hash collisions or reiserfs  do not
> likes long directories.
>
> Because of my previous bad experiences with losing this directory -  i am
> using rdist to backup it now. In some cases both directories (original
> and backup) are corrupted.
>
> i have 3090 files  in  this directory - this is not  that much, on ext2
> it is quite slow when compared to reiser, but ext2 do not have any
> problems with directory  corruption here. Anybody experienced this?

I have debian runing on reiserfs and have had it for several years.  No 
problems with directory corruption here.

Ed Tomlinson

