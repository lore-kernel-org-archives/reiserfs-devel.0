From: Alexander Lyamin <flx@msu.ru>
Subject: Re: Where are the plugins?
Date: Tue, 2 Sep 2003 15:54:41 +0400
Message-ID: <20030902155441.B8083@t-raenon.nmd.msu.ru>
References: <3F51080F.7060901@mail.utexas.edu>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15510-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F51080F.7060901@mail.utexas.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeffrey Yasskin <jyasskin@mail.utexas.edu>
Cc: reiserfs-list@namesys.com

Sat, Aug 30, 2003 at 03:24:47PM -0500, Jeffrey Yasskin wrote:
> I've been looking at the reiser4 source code for a few days, and I can't 
> find any non-essential plugins.
> 
> For example: You say on the website that you've written several security 
> plugins for DARPA, but the only files in fs/reiser4/plugin/security/ are 
> acl.c and perm.{c,h}, and acl.c is empty.
> On the website you also suggest writing a plugin so /etc/passwd can be 
> split in to individually-permissioned sub-files. Is that plugin written 
> yet, or is it just an idea?
> 
> I'd like to write a few plugins to move mp3s' and oggs' meta-data into 

Personally I had about same idea to navigate through my media archive
with ease ;) 

Theres couple of plugins which supposed to be well documented which
are in process of development AFAIK, but let Hans and team comment
on this topic ;)

> the filesystem, and it'd be a lot easier if there were an example to 
> copy from. (Would it be better just to move that kind of plugin into a 
> userspace callback?)


> 
> Thanks,
> Jeffrey

-- 
"the liberation loophole will make it clear.."
lex lyamin
