From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: ioctl and return parameters
Date: Mon, 26 Apr 2004 12:16:45 +0400
Message-ID: <1082967405.2590.119.camel@tribesman.namesys.com>
References: <001901c42a87$00d495a0$7e32a5d1@energy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18220-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <001901c42a87$00d495a0$7e32a5d1@energy>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jenn sirp <sirpj@ecs.csus.edu>
Cc: reiserfs-list@namesys.com

Hello

On Sun, 2004-04-25 at 09:34, jenn sirp wrote:
> Hi,
> 
> I have a couple of questions and am in need of an opinion. . .
> 
> I have a linked list full of filenames that are stored in the order they are
> written to in a reiser file system. I would like to be able to return this
> list from kernel space to user space so that the list can be accessed by an
> outside application. The man page for the ioctl call says ioctl can take
> additional parameters. Can I place more parameters in the ioctl definition
> and access them in reiserfs_ioctl()? Specifically, can I pass a structure
> from user space to the reiserfs_ioctl function to fill in the list data and
> return?
yes.
Create a structure in user space and pass pointer to it as a third
argument of ioctl. In filesystem ioctl you can then do whatever you want
with that user space structure.
> 
> I have only poked around a bit with the innards of ioctl, but I haven't had
> success returning kernel space data to user space.

You have to use get_user and put_user to exchange data between kernel
and user space. You may want to take a look at how FIBMAP request is
handled in linux/fs/ioctl.c:file_ioctl(). Argument arg is a pointer to
user space where logical block number is store. get_user reads arg's
content to variable block. File system bmap operation is called to
convert logical block number to on disk address. put_user is then used
to copy return data to user space.


>  I have looked at the vfs
> code for ioctl and am a bit confused on how additional parameters would be
> handled by the vfs before calling reiser code.
> 
Vfs will not handle anything if command is unknown. It will just pass
input paramaters down to filesystem's ioctl.

> 
> Alternatively, would it be wiser to explore a copy from kernel space to user
> space through proc instead?
> 
> Any hints would greatly increase my level of happiness,
> 
> thank you.
> 
> Jenn
> 
> 

