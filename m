From: "jenn sirp" <sirpj@ecs.csus.edu>
Subject: ioctl and return parameters
Date: Sat, 24 Apr 2004 22:34:38 -0700
Message-ID: <001901c42a87$00d495a0$7e32a5d1@energy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18199-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I have a couple of questions and am in need of an opinion. . .

I have a linked list full of filenames that are stored in the order they are
written to in a reiser file system. I would like to be able to return this
list from kernel space to user space so that the list can be accessed by an
outside application. The man page for the ioctl call says ioctl can take
additional parameters. Can I place more parameters in the ioctl definition
and access them in reiserfs_ioctl()? Specifically, can I pass a structure
from user space to the reiserfs_ioctl function to fill in the list data and
return?

I have only poked around a bit with the innards of ioctl, but I haven't had
success returning kernel space data to user space. I have looked at the vfs
code for ioctl and am a bit confused on how additional parameters would be
handled by the vfs before calling reiser code.


Alternatively, would it be wiser to explore a copy from kernel space to user
space through proc instead?

Any hints would greatly increase my level of happiness,

thank you.

Jenn

