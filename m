From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: ReiserFS 3.6 - Unable to access some files
Date: Tue, 20 Dec 2005 18:15:32 +0300
Message-ID: <43A82014.1080608@namesys.com>
References: <43A81EB4.8080907@apartia.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27460-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43A81EB4.8080907@apartia.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Laurent CARON <lcaron@apartia.fr>
Cc: reiserfs-list@namesys.com

Hello

Laurent CARON wrote:
> Hi,
> 
> I'm currently using a big (1.2Tb) Reiser3.6 filesystem under debian SID
> (Kernel 2.6.13).
> 
> Problem: I'm trying to delete a file, but unfortunately.... it won't me
> delete it.
> 
> server:/var/tmp# rm -Rf network.old
> rm: cannot remove `network.old/Makefile': Permission denied
> 

is there anything in system logs?

> cd ./network.old
> server:/var/tmp/network.old# ls -al
> ls: Makefile: Permission denied
> total 0
> drwxrwxrwt+ 2 root Domain Users  72 2005-07-13 10:17 ./
> drwxrwxrwt  4 root root         104 2005-12-02 13:42 ../
> 
> server:/var/tmp/network.old# stat *
> stat: cannot stat `Makefile': Permission denied
> 
> 
> Is this a filesystem corruption, a bug in reiserfs....?
> 

It looks like a filesystem corruption: there is a name in a directory, but the
file itself can not be found.
