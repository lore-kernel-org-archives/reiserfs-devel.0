From: "jenn sirp" <sirpj@ecs.csus.edu>
Subject: reiser modification for file queuing
Date: Mon, 15 Mar 2004 20:36:24 -0800
Message-ID: <003101c40b10$3d8fc0f0$c435a5d1@energy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17233-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>Can  you tell me a little bit about this? ;-)  Welcome.


Hi,

Thank You. How great. I am adding a built in queuing mechanism to your
system. The idea is to have the built in functionality so that as files are
created they are placed in a queue (implemented as a linked list); this
queue always returns the next file to be processed. It is intended to speed
up an existing application that resides in user space and dumps query files
on to a database for further processing.

In a lot of ways it doesn't necessarily make sense. It should be probably be
a part of the VFS, akin to all file systems. Or just left in user space. But
it is an Intern project and it is so very cool. I asked to build a small FS
from the ground-up -- so if I have success here I will be doing that this
summer.

I started poking into your namei.c file (reiserfs_add_entry) and I've been
having some good results. Everything will probably get moved into ioctl
later but I am still trying to figure things out.

Your code is nice,

Jenn

