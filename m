From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Data corruption on reiserfs
Date: Tue, 22 Oct 2002 15:02:56 +0400
Message-ID: <200210221502.56716.vitaly@namesys.com>
References: <017001c27993$331f5500$0a00a8c0@nemesis>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11739-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <017001c27993$331f5500$0a00a8c0@nemesis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Torsten Scholz <t.scholz@alfeld.de>, reiserfs-list@namesys.com


Hi,

On Tuesday 22 October 2002 10:21, Torsten Scholz wrote:
> Hi all,
>
> last time to get some help....
>
> I have a data corruption on a rieserfs partition (80GB). After repair with
> gpart and reiserfsck (-s --rebuild-tree) all the data seams to be restored,
> but inside the files is only a small part of the original data. Can anyone
> give some hints how to recover the whole data back?

--scan-whole-partition is an expert option now because it is supposed to 
be used in some special cases only. What it does is it overwrites data in 
the tree with data found in unused space. It is useful if you occasionally 
have deleted some data or fsck has not recovered some and you want to get 
smth from unused space. But it could recover some useless stuff or even 
corrupt some other data, so you should backup all important data before 
using it. So, you have just recovered all found old data, which could 
overwrite some of your uptodate data.

-- 

Thanks,
Vitaly Fertman
