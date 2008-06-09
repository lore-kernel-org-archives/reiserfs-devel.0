From: John <geearf@free.fr>
Subject: Re: How do I compile a Reiser4 enabled kernel for use on opensuse 11rc1 - 64 bit
Date: Mon, 9 Jun 2008 08:56:55 +0200
Message-ID: <73dc97ec25ea6e13a9570f667d88b1cc@free.fr>
References: <23466.202.168.22.19.1212986902.squirrel@webmail.velocity.net.au>
Reply-To: geearf@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <23466.202.168.22.19.1212986902.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org



On Mon, 9 Jun 2008 14:48:22 +1000 (EST), doiggl@velocitynet.com.au wrote:
> Hello,

Hello
> I have a reiser4 query.
> 
> Questions.
> 1. I would like to set up a reiser4 file system and I need help on how to
> compile a kernel for it. Can you tell me the steps to compile and install
> a reiser4 enabled kernel please ?. I would use a vanilla kernel to patch
> and build.
Here you will find a tutorial for that:
http://linuxhelp.150m.com/installs/compile-kernel.htm
> 
> 2. What command do I use to format a blank disk partition to reiser4 ? so
> I can use it.
for a normal partition: mkfs.reiser4 /dev/yourpartition
for a cryptcompress partition: mkfs.reiser4 -o create=ccreg40 /dev/yourpartition

> 3. How can I validate a reiser4 partition is ok ?.
> 
fsck.reiser4 /dev/yourpartition (with the partition unmounted)?
> I am using opensuse 11 rc1 (64 bit system) on a test pc with a additional
> hard disk with no partitions on it and would like to set up reiser4 on it.
> 
> I can get reiser4progs and reiser4progs-devel already compiled to a rpm
> from:
> http://download.opensuse.org/repositories/home:/lmich/openSUSE_11.0/x86_64/reiser4progs-1.0.6-15.3.x86_64.rpm
> http://download.opensuse.org/repositories/home:/lmich/openSUSE_11.0/x86_64/reiser4progs-devel-1.0.6-15.3.x86_64.rpm
> 
> Thankyou Glenn
> 


