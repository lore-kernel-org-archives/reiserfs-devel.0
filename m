From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Where are the plugins?
Date: Tue, 2 Sep 2003 16:54:13 +0400
Message-ID: <16212.37621.284660.998958@laputa.namesys.com>
References: <3F51080F.7060901@mail.utexas.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15512-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F51080F.7060901@mail.utexas.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeffrey Yasskin <jyasskin@mail.utexas.edu>
Cc: reiserfs-list@namesys.com

Jeffrey Yasskin writes:
 > I've been looking at the reiser4 source code for a few days, and I can't 
 > find any non-essential plugins.
 > 
 > For example: You say on the website that you've written several security 
 > plugins for DARPA, but the only files in fs/reiser4/plugin/security/ are 
 > acl.c and perm.{c,h}, and acl.c is empty.
 > On the website you also suggest writing a plugin so /etc/passwd can be 
 > split in to individually-permissioned sub-files. Is that plugin written 
 > yet, or is it just an idea?

These plugins will be written later. For now, reiser4 has only plugins
necessary to implement basic file system semantics: regular files,
directories, special files, etc. There are also "pseudo" files used to
access meta data. Plugin for crypto-compressed files is currently work
in progress.

 > 
 > I'd like to write a few plugins to move mp3s' and oggs' meta-data into 
 > the filesystem, and it'd be a lot easier if there were an example to 
 > copy from. (Would it be better just to move that kind of plugin into a 
 > userspace callback?)
 > 
 > Thanks,
 > Jeffrey
 > 

Nikita.
