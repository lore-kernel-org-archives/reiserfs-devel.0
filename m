From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: disk runs full
Date: Thu, 12 May 2005 11:30:27 +0400
Message-ID: <1115883018.3605.15.camel@tribesman.namesys.com>
References: <42828414.1070701@gruber.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42828414.1070701@gruber.cn>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Gruber <alex@gruber.cn>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-05-12 at 02:15, Alexander Gruber wrote:
> Hi together,
> 
> since several weeks the root partition (of course reiserfs, v3.6)  of 
> our webserver runs slowly full although there are not enough files on 
> the disk to fill up all the space. After a reboot everything is fine again!

Do I understand corectly that after some time of webserver work free
space on root filesystem runs out and comes back on reboot?
How did you check that there are not enough files to fill up all the
space?

> I already searched google and the mail archive but the only hint i found 
> was about open files but lsof shows not even one opened file on the root 
> partition. Of course /var /home etc. are on different partitions.
> 
> Please help me!
> 
> Regards
> 
> Alex
> 

