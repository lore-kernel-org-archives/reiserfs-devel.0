From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs version???
Date: Thu, 7 Aug 2003 14:34:45 +0400
Message-ID: <20030807103445.GA14416@namesys.com>
References: <20030807102642.GA14567@hydra.bitwizard.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15220-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030807102642.GA14567@hydra.bitwizard.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wolff@hydra.bitwizard.nl
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Aug 07, 2003 at 12:26:42PM +0200, wolff@hydra.bitwizard.nl wrote:

> Normally, fsck would be able to use a backup superblock. But it
> seems that reiserfsck is not capable of this. 

reiserfs does not have any backup superblocks.

> Now --rebuild-sb asks me for the version. I really wouldn't know. 

Well, if you use recent enough fsck, it also gives some hints on how to find the version
(I really hope you are using reiserfsprogs 3.6.11, if you are not, then I suggest
you to upgrade your reiserfsprogs first).

If you store files of bigger than 2Gb in size on that FS, then it is of 3.6 version.
If you run 2.2 kernel on your fileserver, then it is of 3.5 version.
If you run 2.4 kernel on your fileserver and you still have logs from past boots,
see if there is "reiserfs: using 3.5.x disk format" message after mounting that fs.
If there is, then this is 3.5 format, if there is not then it has 3.6 format.
If you do not have any logs and you use kernel 2.4, then you may choose 3.6 format
and it won't hurt (but you won't be able to mount such a volume
with 2.2 kernel later on).

Bye,
    Oleg
