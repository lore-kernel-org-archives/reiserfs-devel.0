From: Hans Reiser <reiser@namesys.com>
Subject: Re: Where are the plugins?
Date: Wed, 03 Sep 2003 02:19:44 +0400
Message-ID: <3F551780.1030701@namesys.com>
References: <3F51080F.7060901@mail.utexas.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15518-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F51080F.7060901@mail.utexas.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeffrey Yasskin <jyasskin@mail.utexas.edu>
Cc: reiserfs-list@namesys.com

Jeffrey Yasskin wrote:

> I've been looking at the reiser4 source code for a few days, and I 
> can't find any non-essential plugins. 

This is called the minimal functionality for first release project 
management style. ;-)

>
>
> For example: You say on the website that you've written several 
> security plugins for DARPA,

oh dear, if you send nikita (offlist) the lines he'll correct them.

> but the only files in fs/reiser4/plugin/security/ are acl.c and 
> perm.{c,h}, and acl.c is empty.
> On the website you also suggest writing a plugin so /etc/passwd can be 
> split in to individually-permissioned sub-files. Is that plugin 
> written yet, or is it just an idea? 

Umh, it is in our contract, so that makes it more than an idea;-), 
however the person working on file inheritance got put on encryption and 
hasn't finished that yet.  There exists some code somewhere that I need 
to review and....

>
>
> I'd like to write a few plugins to move mp3s' and oggs' meta-data into 
> the filesystem, and it'd be a lot easier if there were an example to 
> copy from. (Would it be better just to move that kind of plugin into a 
> userspace callback?)
>
> Thanks,
> Jeffrey
>
>
>
I agree that we need examples..... and more plugins.....;-)

-- 
Hans


